# DOCKER

```bash
# 停止全部容器
docker stop $(docker ps -aq)

# 删除全部容器
docker rm $(docker ps -aq)

# 查看空间占用情况
docker system df

# 清理空间
docker system prune
```
