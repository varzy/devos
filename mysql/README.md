# MySQL

## 添加外部访问权限

```bash
# 进入容器内的 mysql
docker exec -it lc_mysql bash
mysql -uroot -p

# 添加外部访问权限
use mysql;
GRANT ALL ON *.* TO 'root'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'pswd';
FLUSH PRIVILEGES;
```

## 复制配置文件

```bash
docker cp lc_mysql:/etc/mysql/my.cnf ./mysql/my.cnf
```

## 设置默认时区

```conf
# 设置默认时区
[mysqld]
default-time_zone = '+8:00'
```
