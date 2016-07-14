#!/bin/bash

set -eu
cd /tmp

apt-get install -y aufs-tools wget
wget http://ftp.unicamp.br/pub/ppc64el/ubuntu/14_04/docker-1.9.1-ppc64el/pool/main/d/docker.io/docker.io_1.9.1~git20151210-18bfacb_ppc64el.deb
dpkg -i docker.io_1.9.1~git20151210-18bfacb_ppc64el.deb
dpkg -r docker.io
rm -rf /tmp/*