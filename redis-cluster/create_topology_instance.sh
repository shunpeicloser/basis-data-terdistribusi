sudo docker network create --subnet=192.169.16.0/24 redis;

# create cluster node
sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.17 \
    -p 6379:6379 \
    --name node-1 \
    --hostname node-1 \
    -e REDIS_REPLICATION_MODE=master \
    -e ALLOW_EMPTY_PASSWORD=yes \
    bitnami/redis;

sleep 5;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.18 \
    -p 6380:6379 \
    --name node-2 \
    --hostname node-2 \
    -e REDIS_REPLICATION_MODE=slave \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
    -e ALLOW_EMPTY_PASSWORD=yes \
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
    -e ALLOW_EMPTY_PASSWORD=yes \
    bitnami/redis;

sleep 5;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.20 \
    -p 26379:26379 \
    --name sentinel-1 \
    --hostname sentinel-1 \
    -e REDIS_MASTER_HOST=192.169.16.17 \
    -e REDIS_MASTER_PORT_NUMBER=6379 \
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
    -e REDIS_SENTINEL_QUORUM=2 \
    bitnami/redis-sentinel;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.23 \
    -p 33060:3306 \
    --name mysql \
    --hostname mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_USER=dbuser \
    -e MYSQL_PASSWORD=dbpassword \
    -e MYSQL_DATABASE=redistest \
    -e MYSQL_DATABASE=noredis \
    mysql:5.7;

sleep 30;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.24 \
    -p 50001:80 \
    --name wordpress \
    --hostname wordpress \
    -e WORDPRESS_DB_HOST=192.169.16.23 \
    -e WORDPRESS_DB_USER=dbuser \
    -e WORDPRESS_DB_PASSWORD=dbpassword \
    -e WORDPRESS_DB_NAME=redistest \
    -e WORDPRESS_CONFIG_EXTRA='define("WP_REDIS_CLIENT", "predis");
                               define("WP_REDIS_SENTINEL", "mymaster");
                               define("WP_REDIS_SERVERS",
                                          ["tcp://192.169.16.20:26379?alias=sentinel-1",
                                           "tcp://192.169.16.21:26379?alias=sentinel-2",
                                           "tcp://192.169.16.22:26379?alias=sentinel-3"]); \
                               define("WP_CACHE", true);' \
    wordpress:5.3.0-apache;

sudo docker run -d --rm \
    --net redis \
    --ip 192.169.16.25 \
    -p 50001:80 \
    --name wordpress-nr \
    --hostname wordpress \
    -e WORDPRESS_DB_HOST=192.169.16.23 \
    -e WORDPRESS_DB_USER=dbuser \
    -e WORDPRESS_DB_PASSWORD=dbpassword \
    -e WORDPRESS_DB_NAME=noredis \
    wordpress:5.3.0-apache;
