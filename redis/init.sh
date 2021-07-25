docker stop redis

docker rm redis

docker run \
  -d \
  --name redis \
  -p 6379:6379 \
  -v /Users/zy/Developer/_Docker/redis/redis.conf:/etc/redis/redis.conf \
  -v /Users/zy/Developer/_Docker/redis/data:/data \
  redis:alpine redis-server /etc/redis/redis.conf
