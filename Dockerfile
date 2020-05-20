FROM ubuntu:16.04
MAINTAINER Quan Vu <vuhongquanbk97@gmail.com>

ARG http_proxy
ENV http_proxy $http_proxy
ARG https_proxy
ENV https_proxy $https_proxy
ARG no_proxy
ENV no_proxy $no_proxy
ARG username

# make a non-root user
RUN adduser --disable-password --gecos '' $username && \
    usermod -aG sudo $username && \
    echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# start up docker images
USER $username
ENV HOME /home/$username
ENV LANG en_US.UTF-8
