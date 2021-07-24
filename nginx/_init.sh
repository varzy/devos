docker run \
  --name lc_nginx \
  -d \
  -p 80:80 \
  -v /Users/zy/Developer/_Docker/nginx/conf.d:/etc/nginx/conf.d \
  -v /Users/zy/Developer/_Docker/nginx/html:/usr/share/nginx/html \
  -v /Users/zy/Developer/_Docker/nginx/logs:/var/log/nginx \
  nginx
