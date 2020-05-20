FROM ubuntu:16.04
MAINTAINER Quan Vu <vuhongquanbk97@gmail.com>

ARG http_proxy
ENV http_proxy $http_proxy
ARG https_proxy
ENV https_proxy $https_proxy
ARG no_proxy
ENV no_proxy $no_proxy


