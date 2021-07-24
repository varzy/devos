docker run \
  --name lc_mysql \
  -d \
  --restart=always \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD="pswd" \
  -v /Users/zy/Developer/_Docker/mysql/my.cnf:/etc/mysql/my.cnf \
  -v /Users/zy/Developer/_Docker/mysql/data:/var/lib/mysql \
  mysql
