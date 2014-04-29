#!/usr/bin/env bash

USER=vagrant
USERHOME=/home/vagrant
NODE_VERSION="0.10.26"
NGINX_VERSION="1.4.7"

apt-get update
apt-get install -y build-essential curl git vim nmap

chown -R $USER $USERHOME

mkdir -p /data/logs /data/program

apt-get install -y gcc libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev ntp
cd ~

wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar xzvf nginx-${NGINX_VERSION}.tar.gz

cd nginx-${NGINX_VERSION}
./configure --prefix=/data/program/nginx-${NGINX_VERSION} \
--error-log-path=/data/logs/nginx/error.log \
--http-log-path=/data/logs/nginx/access.log \
--with-http_ssl_module \
--with-http_stub_status_module

make && make install
ln -s /data/program/nginx-${NGINX_VERSION} /data/program/nginx

cd /data/program/nginx
