#!/usr/bin/env bash

# install lxc and lxd
sudo apt-get udpate -y \
&& apt-get install -y \
   'lxc' \
   'lxd' \
   'python3-pylxd' \
   'python3-openssl'