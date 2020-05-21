FROM ubuntu:16.04
MAINTAINER Quan Vu <quanvh9@viettel.com.vn>

ARG http_proxy
ENV http_proxy $http_proxy
ARG https_proxy
ENV https_proxy $https_proxy
ARG user
ENV USER $user

ENV DEBIAN_FRONTEND noninteractive
# ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo 'root:Docker!' | chpasswd # change passwd of sudo user
# RUN echo 'Docker!' | passwd --stdin root

# make a $user
RUN adduser --disabled-password --gecos '' $user && \
    usermod -aG sudo $user && \
    echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN echo "Acquire::http::proxy \"$http_proxy\";" | tee -a /etc/apt/apt.conf && \
#     echo "Acquire::https::proxy \"$https_proxy\";" | tee -a /etc/apt/apt.conf && \
#     echo 'PS1="[\u@\h \w]\n\$ "' | tee -a /root/.bashrc 1>/dev/null

RUN echo "Acquire::http::proxy \"$http_proxy\";" | tee -a /etc/apt/apt.conf && \
    echo "Acquire::https::proxy \"$https_proxy\";" | tee -a /etc/apt/apt.conf

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y locales && \
      localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && export LANG=en_US.utf8
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y \
    vim

USER $user
WORKDIR /home/$user
