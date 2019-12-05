sudo docker network create --subnet=192.170.16.0/24 fpnet;

# create placement driver
sudo docker run -d \
    --name pd1 \
    --net fpnet \
    --ip 192.170.16.19 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/pd:latest \
    --name="pd1" \
    --data-dir="/data/pd1" \
    --client-urls="http://0.0.0.0:2379" \
    --advertise-client-urls="http://192.170.16.19:2379" \
    --peer-urls="http://0.0.0.0:2380" \
    --advertise-peer-urls="http://192.170.16.19:2380" \
    --initial-cluster="pd1=http://192.170.16.19:2380,pd2=http://192.170.16.20:2380,pd3=http://192.170.16.21:2380";

sudo docker run -d \
    --name pd2 \
    --net fpnet \
    --ip 192.170.16.20 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/pd:latest \
    --name="pd2" \
    --data-dir="/data/pd2" \
    --client-urls="http://0.0.0.0:2379" \
    --advertise-client-urls="http://192.170.16.20:2379" \
    --peer-urls="http://0.0.0.0:2380" \
    --advertise-peer-urls="http://192.170.16.20:2380" \
    --initial-cluster="pd1=http://192.170.16.19:2380,pd2=http://192.170.16.20:2380,pd3=http://192.170.16.21:2380";

sudo docker run -d \
    --name pd3 \
    --net fpnet \
    --ip 192.170.16.21 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/pd:latest \
    --name="pd3" \
    --data-dir="/data/pd3" \
    --client-urls="http://0.0.0.0:2379" \
    --advertise-client-urls="http://192.170.16.21:2379" \
    --peer-urls="http://0.0.0.0:2380" \
    --advertise-peer-urls="http://192.170.16.21:2380" \
    --initial-cluster="pd1=http://192.170.16.19:2380,pd2=http://192.170.16.20:2380,pd3=http://192.170.16.21:2380";

sleep 10;

# create cluster node
sudo docker run -d \
    --name tikv1 \
    --net fpnet \
    --ip 192.170.16.16 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.16:20160" \
    --data-dir="/data/tikv1" \
    --pd="192.170.16.19:2379,192.170.16.20:2379,192.170.16.21:2379";

sudo docker run -d \
    --name tikv2 \
    --net fpnet \
    --ip 192.170.16.17 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.17:20160" \
    --data-dir="/data/tikv2" \
    --pd="192.170.16.19:2379,192.170.16.20:2379,192.170.16.21:2379";

sudo docker run -d \
    --name tikv3 \
    --net fpnet \
    --ip 192.170.16.18 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.18:20160" \
    --data-dir="/data/tikv3" \
    --pd="192.170.16.19:2379,192.170.16.20:2379,192.170.16.21:2379";

sleep 10;

sudo docker run -d \
    --name tidb \
    --net fpnet \
    --ip 192.170.16.22 \
    -p 4000:4000 \
    -p 10080:10080 \
    -v /etc/localtime:/etc/localtime:ro \
    pingcap/tidb:latest \
    --store=tikv \
    --path="192.170.16.19:2379,192.170.16.20:2379,192.170.16.21:2379";

sleep 20;

# dump to tidb
myloader -d dump/ -h 127.0.0.1 -u root -P 4000;

# copy node_exporter to node to be monitored
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter pd1:/;
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter pd2:/;
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter pd3:/;
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter tikv1:/;
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter tikv2:/;
sudo docker cp ./prometheus/node_exporter-0.18.1.linux-amd64/node_exporter tikv3:/;

# run node_exporter
sudo docker exec -d -it pd1 ./node_exporter;
sudo docker exec -d -it pd2 ./node_exporter;
sudo docker exec -d -it pd3 ./node_exporter;
sudo docker exec -d -it tikv1 ./node_exporter;
sudo docker exec -d -it tikv2 ./node_exporter;
sudo docker exec -d -it tikv3 ./node_exporter;

sleep 10;

sudo docker run -d \
    --name prom \
    --net fpnet \
    --ip 192.170.16.23 \
    -p 9090:9090 \
    -v "/home/miris/Kuliah/7th Story/basis-data-terdistribusi/fp/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml" \
    prom/prometheus \
    --config.file=/etc/prometheus/prometheus.yml;

sleep 5;

wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/pd.json -P ./grafana/;
wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/tidb.json -P ./grafana/;
wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/tidb_summary.json -P ./grafana/;
wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/tikv_summary.json -P ./grafana/;
wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/tikv_details.json -P ./grafana/;
wget https://raw.githubusercontent.com/pingcap/tidb-ansible/master/scripts/tikv_trouble_shooting.json -P ./grafana/;

sudo docker run -d \
    --name grafana \
    --net fpnet \
    --ip 192.170.16.24 \
    -p 3000:3000 \
    -v "/home/miris/Kuliah/7th Story/basis-data-terdistribusi/fp/grafana/grafana.ini:/conf/grafana.ini" \
    grafana/grafana \
    --config="/conf/grafana.ini";