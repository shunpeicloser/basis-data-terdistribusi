# Implementasi MongoDB Sharding #
## Topology ##


## Development Environment ##
Linux Mint 19.1 Teressa 8GB 64-bit

## Requirements ##
- Docker
- PHP 7.2

## Outline ##
- Instalasi requirement dan persiapan
- Menjalankan MongoDB Docker

## Instalasi Requirement dan Persiapan ##
- Docker
 ```bash
sudo apt-get install docker-engine
 ```
- PHP 7.2
 ```bash
sudo apt-get install php7.2
 ```
- MongoDB Docker Image
 ```bash
sudo docker pull mongo:4.2
 ```

## Menjalankan MongoDB Docker ##
- Membuat Docker Network
```bash
sudo docker network create --subnet=192.168.0.0/22 mdbnet
```
- Menjalankan MongoDB Docker Instance sebagai Config Server
```bash
sudo docker run -d --net mdbnet --ip 192.168.1.1 -p 37019:27019 --name config-1 --hostname config-1 mongo:4.2 --replSet config-conf --configsvr

sudo docker run -d --net mdbnet --ip 192.168.1.2 -p 37029:27019 --name config-2 --hostname config-2 mongo:4.2 --replSet config-conf --configsvr
```
**Keterangan: port 27019 adalah default port untuk config server MongoDB**

- Melakukan inisiasi Replica Set untuk Config Server (Jalankan hanya pada satu config server yang akan digunakan sebagai master)
```bash
sudo docker exec -d -it config-1 mongo -port 27019 --eval 'rs.initiate({ _id: "config-conf", members: [{ _id: 0, host: "192.168.1.1:27019" }, { _id: 1, host: "192.168.1.2:27019" }]});'
```

- Menjalankan MongoDB Docker Instance sebagai Shard Server
```bash
sudo docker run -d --net mdbnet --ip 192.168.2.1 -p 47018:27018 --name shard-1 --hostname shard-1 mongo:4.2 --shardsvr

sudo docker run -d --net mdbnet --ip 192.168.2.2 -p 47028:27018 --name shard-2 --hostname shard-2 mongo:4.2 --shardsvr

sudo docker run -d --net mdbnet --ip 192.168.2.3 -p 47038:27018 --name shard-3 --hostname shard-3 mongo:4.2 --shardsvr
```
**Keterangan: port 27018 adalah default port untuk shard server MongoDB**

- Menjalankan MongoDB Docker Instance sebagai Router
```bash
sudo docker run -d --net mdbnet --ip 192.168.0.2 -p 27017:27107 --name router --hostname router mongo:4.2 mongos --configdb config-conf/192.168.1.1:27019,192.168.1.2:27019
```

- Expose shard server ke router
```bash
sudo docker exec -d -it router mongo --eval 'sh.addShard("192.168.2.1:27018"); sh.addShard("192.168.2.2:27018"); sh.addShard("192.168.2.3:27018"); use testdb; sh.enableSharding("testdb");'
```

- Aktifkan sharding pada database dan collection
```bash
sudo docker exec -d -it router mongo --eval 'use testdb; sh.enableSharding("testdb");'
```