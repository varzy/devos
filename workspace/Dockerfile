FROM ubuntu:22.04
LABEL maintainer="varzy <varzy@live.com>"

ARG AT_CHINA=false
ARG TZ=UTC
ENV TZ ${TZ}
ENV DEBIAN_FRONTEND noninteractive

USER root

########################################
# Source
########################################
RUN if [ ${AT_CHINA} = true ]; then \
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
RUN apt install -y curl wget git vim software-properties-common

########################################
# Node
########################################
ARG NVM_DIR=/root/.nvm

# NVM & Node
RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    if [ ${AT_CHINA} ]; then \
      echo "" >> ~/.bashrc && \
      echo 'export NVM_NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"' >> ~/.bashrc \
    ;fi && \
    nvm install --lts

# Npm
RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    if [ ${AT_CHINA} ]; then \
      npm config set registry https://registry.npm.taobao.org \
    ;fi && \
    npm install -g yarn pnpm

########################################
# GO
########################################
RUN add-apt-repository ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y golang-go

########################################
# Java
########################################
RUN apt install -y wget apt-transport-https
RUN mkdir -p /etc/apt/keyrings && \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
RUN echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt update && \
    apt install -y temurin-17-jdk

########################################
# Clean up
########################################
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

USER root
WORKDIR /workspace
