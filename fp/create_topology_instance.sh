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