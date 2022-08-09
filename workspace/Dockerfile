FROM ubuntu:20.04

LABEL maintainer="varzy <varzy@live.com>"

ARG AT_CHINESE_MAINLAND=false
ARG TZ=UTC
ENV TZ ${TZ}

########################################
# Source
########################################
RUN if [ ${AT_CHINESE_MAINLAND} = true ]; then \
      cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
      sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    ;fi
RUN apt update -y

########################################
# Timezone
########################################
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

########################################
# Lang
########################################
RUN apt install -y locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

########################################
# Basic packages
########################################
RUN apt install -y curl git vim software-properties-common

########################################
# Node
########################################
ARG NVM_DIR=/root/.nvm

# NVM & Node
RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    echo 'export NVM_DIR="$NVM_DIR"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc && \
    . $NVM_DIR/nvm.sh && \
    if [ ${AT_CHINESE_MAINLAND} ]; then \
      echo "" >> ~/.bashrc && \
      echo 'export NVM_NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"' >> ~/.bashrc \
    ;fi && \
    nvm install node
# Npm & Yarn
RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    if [ ${AT_CHINESE_MAINLAND} ]; then \
      npm config set registry https://registry.npm.taobao.org \
    ;fi && \
    npm install -g yarn && \
    if [ ${AT_CHINESE_MAINLAND} ]; then \
      yarn config set registry https://registry.npm.taobao.org \
    ;fi && \
    echo "" >> ~/.bashrc && \
    echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.bashrc && \
    yarn global add @vue/cli prettier eslint serve

########################################
# GO
########################################
RUN apt install golang-go -y && \
    if [ ${AT_CHINESE_MAINLAND} ]; then \
      go env -w GOPROXY=https://goproxy.cn,https://gocenter.io,https://goproxy.io,direct \
    ;fi && \
    go clean --modcache

########################################
# Python
########################################
RUN apt install python3-pip -y

########################################
# Final
########################################
# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

WORKDIR /workspace

EXPOSE 22 8000-8999
