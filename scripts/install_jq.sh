#!/bin/sh

set -eu
#apt-get update
#apt-get install -y libcurl4-openssl-dev
cd /tmp
git clone https://github.com/stedolan/jq.git
cd jq
autoreconf -i
./configure --disable-maintainer-mode
make
sudo make install
rm -rf /tmp/*
