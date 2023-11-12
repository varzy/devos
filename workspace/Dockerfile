FROM ubuntu:22.04
LABEL maintainer="varzy <varzy@live.com>"

ARG AT_CHINA=false
ENV AT_CHINA ${AT_CHINA}
ENV DEBIAN_FRONTEND noninteractive

USER root

########################################
# Apt Source
########################################

RUN if [ ${AT_CHINA} = true ]; then \
  cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
  sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
  apt-get update -yqq \
;fi

########################################
# Timezone
########################################

ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

########################################
# Lang
########################################

RUN apt-get install -yqq locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

########################################
# Basic packages
########################################

RUN apt-get install -yqq curl wget git vim software-properties-common

########################################
# Node
########################################

ARG NVM_DIR=/root/.nvm
ARG WORKSPACE_INSTALL_NODE
ARG WORKSPACE_NODE_VERSION=--lts

# NVM & Node
RUN if [ ${WORKSPACE_INSTALL_NODE} = true ]; then \
  mkdir -p $NVM_DIR && \
  if [ ${AT_CHINA} = true ]; then \
    curl -o- https://ghp.quickso.cn/https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash \
  ;else \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash \
  ;fi && \
  . $NVM_DIR/nvm.sh && \
  if [ ${AT_CHINA} = true ]; then \
    echo "" >> ~/.bashrc && \
    echo 'export NVM_NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"' >> ~/.bashrc \
  ;fi && \
  nvm install ${WORKSPACE_NODE_VERSION} \
;fi

# Source NVM
RUN if [ ${WORKSPACE_INSTALL_NODE} = true ]; then \
  echo "" >> ~/.bashrc && \
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
  echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc \
;fi

########################################
# Yarn
########################################

ARG WORKSPACE_INSTALL_YARN

RUN if [ ${WORKSPACE_INSTALL_YARN} = true ]; then \
  . $NVM_DIR/nvm.sh && \
  npm i -g yarn && \
  echo "" >> ~/.bashrc && \
  echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.bashrc \
;fi

########################################
# Pnpm
########################################

ARG WORKSPACE_INSTALL_PNPM

RUN if [ ${WORKSPACE_INSTALL_PNPM} = true ]; then \
  . $NVM_DIR/nvm.sh && \
  npm i -g pnpm \
;fi

########################################
# JDK
########################################

ARG WORKSPACE_INSTALL_JDK
ARG WORKSPACE_JDK_VERSION=17

RUN if [ ${WORKSPACE_INSTALL_JDK} = true ]; then \
  apt-get install -yqq wget apt-transport-https && \
  mkdir -p /etc/apt/keyrings && \
  wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc && \
  echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
  apt-get update && \
  apt-get install -yqq temurin-${WORKSPACE_JDK_VERSION}-jdk \
;fi

########################################
# Python
########################################

ARG WORKSPACE_INSTALL_PYTHON

RUN if [ ${WORKSPACE_INSTALL_PYTHON} = true ]; then \
  apt-get install -yqq python3 python3-pip python3-venv \
  echo "" >> ~/.bashrc && \
  echo 'alias python="/usr/bin/python3"' >> ~/.bashrc \
;fi

########################################
# GO
########################################

ARG WORKSPACE_INSTALL_GO

RUN if [ ${WORKSPACE_INSTALL_GO} = true ]; then \
  add-apt-repository ppa:longsleep/golang-backports && \
  apt-get update && \
  apt-get install -yqq golang-go \
;fi

########################################
# Rust
########################################

ARG WORKSPACE_INSTALL_RUST

RUN if [ ${WORKSPACE_INSTALL_RUST} = true ]; then \
  curl https://sh.rustup.rs -sSf | bash -s -- -y && \
  echo "" >> ~/.bashrc && \
  echo 'source $HOME/.cargo/env' >> $HOME/.bashrc \
;fi

########################################
# FFEMG
########################################

ARG WORKSPACE_INSTALL_FFMPEG

RUN if [ ${WORKSPACE_INSTALL_FFMPEG} = true ]; then \
  apt-get install -yqq ffmpeg \
;fi

########################################
# Clean up
########################################

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

USER root
WORKDIR /workspace
