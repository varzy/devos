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
# Final
########################################
# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

EXPOSE 22 8000-8100
WORKDIR /var/workspace
