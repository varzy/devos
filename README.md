# DevOS

基于 Docker 的轻量开发环境。

## 开始使用

```bash
# 复制并按照需要进行修改
cp .env.example .env

# 启动自己需要的容器
docker compose up -d caddy mysql redis
```

## 常用命令

```bash
# 停止所有容器
docker stop $(docker ps -aq)

# 删除所有容器
docker rm $(docker ps -aq)

# 删除所有镜像
docker rmi $(docker images -q)
```
