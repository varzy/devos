FROM redis:alpine

LABEL maintainer="varzy <varzy@live.com>"

COPY ./redis.conf /etc/redis/redis.conf

CMD [ "redis-server", "/etc/redis/redis.conf" ]
EXPOSE 6379
