sudo docker network create --subnet=192.169.16.0/24 redis;

# create cluster node
sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.17 \
    -p 6379:6379 \
    --name node-1 \
    --hostname node-1 \
    -e REDIS_REPLICATION_MODE=master \
    -e REDISCLI_AUTH=masterpass \
    -e REDIS_PASSWORD=masterpass \
    bitnami/redis;

sleep 3;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.18 \
    -p 6380:6379 \
    --name node-2 \
    --hostname node-2 \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_MASTER_PASSWORD=masterpass \
    -e REDIS_PASSWORD=slavepass \
    -e REDISCLI_AUTH=slavepass \
    bitnami/redis;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.19 \
    -p 6381:6379 \
    --name node-3 \
    --hostname node-3 \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_MASTER_PASSWORD=masterpass \
    -e REDIS_PASSWORD=slavepass \
    -e REDISCLI_AUTH=slavepass \
    bitnami/redis;

sleep 3;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.20 \
    -p 26379:26379 \
    --name sentinel-1 \
    --hostname sentinel-1 \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_MASTER_PASSWORD=masterpass \
    -e REDIS_SENTINEL_QUORUM=2 \
    bitnami/redis-sentinel;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.21 \
    -p 26380:26379 \
    --name sentinel-2 \
    --hostname sentinel-2 \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_MASTER_PASSWORD=masterpass \
    -e REDIS_SENTINEL_QUORUM=2 \
    bitnami/redis-sentinel;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.22 \
    -p 26381:26379 \
    --name sentinel-3 \
    --hostname sentinel-3 \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e REDIS_MASTER_PASSWORD=masterpass \
    -e REDIS_SENTINEL_QUORUM=2 \
    bitnami/redis-sentinel;

