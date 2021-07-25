docker stop nginx

docker rm nginx

docker run \
  -d \
  --name nginx \
  --restart=always \
  -v /Users/zy/Developer/_Docker/nginx/conf.d:/etc/nginx/conf.d \
  -v /Users/zy/Developer/_Docker/nginx/html:/usr/share/nginx/html \
  -v /Users/zy/Developer/_Docker/nginx/logs:/var/log/nginx \
  -p 80:80 \
  -p 6301:6301 \
  nginx:alpine
