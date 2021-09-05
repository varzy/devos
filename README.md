# DevOS

基于 Docker 的轻量开发环境。

## 开始使用

```bash
# 复制并按照需要进行修改
cp .env.example .env

# 启动自己需要的容器
docker compose up -d caddy mysql redis

# 将 workspace 提交为新镜像
docker commit -a "zy" -m "add node" 38f31d477821 devos_workspace:v1
```

## 常用命令

```bash
# 停止所有容器
docker stop $(docker ps -aq)

# 删除所有容器
docker rm $(docker ps -aq)

# 删除所有镜像
docker rmi $(docker images -q)

# 查看空间占用情况
docker system df

# 清理 docker 占用的磁盘空间
docker system prune

# 清理数据卷
docker volume prune

# 更加彻底地清理 docker 占用的磁盘空间，将删除未使用过的镜像
docker system prune -a

# 只清理编译缓存
docker builder prune
```
