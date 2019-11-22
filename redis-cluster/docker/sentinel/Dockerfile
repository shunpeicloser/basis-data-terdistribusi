from redis:alpine

add sentinel.conf /etc/redis/sentinel.conf
run chown redis:redis /etc/redis/sentinel.conf
env SENTINEL_QUORUM 2
env SENTINEL_DOWN_AFTER 5000
env SENTINEL_FAILOVER 10000
env SENTINEL_PORT 30000
add entrypoint.sh /usr/local/bin
run chmod +x /usr/local/bin/entrypoint.sh
entrypoint ["entrypoint.sh"]