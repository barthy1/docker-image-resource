#!/bin/sh

set -eu
apt-get install -y dh-autoreconf
cd /tmp
git clone https://github.com/stedolan/jq.git
cd jq
autoreconf -i
./configure --disable-maintainer-mode
make
sudo make install
rm -rf /tmp/*
