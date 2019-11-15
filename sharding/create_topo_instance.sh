# create docker network
sudo docker network create --subnet=192.168.0.0/22 mdbnet;

# create and run docker instance
sudo docker run -d --rm --net mdbnet --ip 192.168.1.1 -p 37019:27019 --name config-1 --hostname config-1 mongo:4.2 --replSet config-conf --configsvr;

sudo docker run -d --rm --net mdbnet --ip 192.168.1.2 -p 37029:27019 --name config-2 --hostname config-2 mongo:4.2 --replSet config-conf --configsvr;
sleep 20;
sudo docker exec -d -it config-1 mongo -port 27019 --eval 'rs.initiate({ _id: "config-conf", members: [{ _id: 0, host: "192.168.1.1:27019" }, { _id: 1, host: "192.168.1.2:27019" }]});';

sudo docker run -d --rm --net mdbnet --ip 192.168.2.1 -p 47018:27018 --name shard-1 --hostname shard-1 mongo:4.2 --shardsvr;

sudo docker run -d --rm --net mdbnet --ip 192.168.2.2 -p 47028:27018 --name shard-2 --hostname shard-2 mongo:4.2 --shardsvr;

sudo docker run -d --rm --net mdbnet --ip 192.168.2.3 -p 47038:27018 --name shard-3 --hostname shard-3 mongo:4.2 --shardsvr;
sleep 20;
sudo docker run -d --rm --net mdbnet --ip 192.168.0.2 -p 27017:27107 --name router --hostname router mongo:4.2 mongos --configdb config-conf/192.168.1.1:27019,192.168.1.2:27019;

# configure sharding cluster
sudo docker exec -d -it router mongo --eval 'sh.addShard("192.168.2.1:27018"); sh.addShard("192.168.2.2:27018"); sh.addShard("192.168.2.3:27018");';

sudo docker exec -d -it router mongo --eval 'use testdb;';

sudo docker exec -d -it router mongo --eval 'sh.enableSharding("testdb"); db.createCollection("testCollection_1"); sh.shardCollection("testdb.testCollection_1", {"test_id": 1});';

# open terminal foreach instance
#gnome-terminal -- /bin/sh -c sudo docker exec -it config-1 bash'
#gnome-terminal -- /bin/sh -c sudo docker exec -it config-2 bash'
#gnome-terminal -- /bin/sh -c sudo docker exec -it shard-1 bash'
#gnome-terminal -- /bin/sh -c sudo docker exec -it shard-2 bash'
#gnome-terminal -- /bin/sh -c sudo docker exec -it shard-3 bash'
#gnome-terminal -- /bin/sh -c sudo docker exec -it router bash'
