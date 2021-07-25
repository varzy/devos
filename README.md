# DOCKER

```bash
# 停止全部容器
docker stop $(docker ps -aq)

# 删除全部容器
docker rm $(docker ps -aq)

# 清理缓存
docker system prune --volumes
```
