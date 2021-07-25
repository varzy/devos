# MySQL

## 添加外部访问权限

```bash
# 进入容器内的 mysql
docker exec -it mysql bash
mysql -uroot -p

# 添加外部访问权限
USE mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'pswd' WITH GRANT OPTION;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'pswd';
FLUSH PRIVILEGES;
```

## 复制配置文件

```bash
docker cp mysql:/etc/mysql/my.cnf ./mysql/my.cnf
```

## 设置默认时区

```conf
# 设置默认时区
[mysqld]
default-time_zone = '+8:00'
```
