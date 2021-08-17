FROM ubuntu:20.04

LABEL maintainer="varzy <varzy@live.com>"

########################################
# Source
########################################
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update -y

########################################
# Timezone
########################################
ARG TZ=UTC
ENV TZ ${TZ}
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
RUN apt install -y curl git vim

########################################
# OhMyZSH
########################################
RUN apt install -y zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
RUN ln -f /bin/zsh /bin/sh

########################################
# Nvm, Node, Npm, Yarn
########################################
ENV NPM_REGISTRY ${NPM_REGISTRY}
ENV YARN_REGISTRY ${YARN_REGISTRY}
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    echo "" >> ~/.zshrc && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" ' >> ~/.zshrc && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" ' >> ~/.zshrc && \
    . ~/.zshrc && \
    nvm install node && \
    if [ ${NPM_REGISTRY} ]; then \
      npm config set registry ${NPM_REGISTRY} \
    ;fi && \
    npm install -g yarn && \
    if [ ${YARN_REGISTRY} ]; then \
      yarn config set registry ${YARN_REGISTRY} \
    ;fi && \
    echo "" >> ~/.zshrc && \
    echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.zshrc

########################################
# Final
########################################
# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

WORKDIR /var/workspace
ENTRYPOINT [ "/bin/zsh" ]
