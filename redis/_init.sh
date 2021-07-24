docker run \
  --name lc_redis \
  -d \
  -p 6379:6379 \
  -v /Users/zy/Developer/_Docker/redis/redis.conf:/etc/redis/redis.conf \
  -v /Users/zy/Developer/_Docker/redis/data:/data \
  redis redis-server /etc/redis/redis.conf
