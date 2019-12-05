sudo docker run -d \
    --name pd1 \
    --net fpnet \
    --ip 192.170.16.19 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data:/data \
    pingcap/pd:latest \
    --name="pd1" \
    --client-urls="http://0.0.0.0:2379" \
    --advertise-client-urls="http://192.170.16.19:2379" \
    --peer-urls="http://0.0.0.0:2380" \
    --advertise-peer-urls="http://192.170.16.19:2380" \
    --initial-cluster="pd1=http://192.170.16.19:2380";

sleep 10;

# create cluster node
sudo docker run -d \
    --name tikv1 \
    --net fpnet \
    --ip 192.170.16.16 \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.16:20160" \
    --pd="192.170.16.19:2379";

sudo docker run -d \
    --name tikv2 \
    --net fpnet \
    --ip 192.170.16.17 \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.17:20160" \
    --pd="192.170.16.19:2379";

sudo docker run -d \
    --name tikv3 \
    --net fpnet \
    --ip 192.170.16.18 \
    pingcap/tikv:latest \
    --addr="0.0.0.0:20160" \
    --advertise-addr="192.170.16.18:20160" \
    --pd="192.170.16.19:2379";

sleep 10;

sudo docker run -d \
    --name tidb \
    --net fpnet \
    --ip 192.170.16.22 \
    -p 4000:4000 \
    -p 10080:10080 \
    pingcap/tidb:latest \
    --store=tikv \
    --path="192.170.16.19:2379";

# sleep 20;

# mysql -u root -h 127.0.0.1 -P 4000 -e "create database 'sbtest';"