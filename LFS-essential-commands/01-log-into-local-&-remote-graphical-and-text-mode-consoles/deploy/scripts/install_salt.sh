#!/usr/bin/env bash

# Download key
sudo mkdir -p mkdir /etc/apt/keyrings \
&& sudo curl -fsSL \
   -o '/etc/apt/keyrings/salt-archive-keyring.gpg' \
   "https://repo.saltproject.io/py3/ubuntu/$(lsb_release -sr)/amd64/latest/salt-archive-keyring.gpg"

# Create apt sources list file
cat <<EOF | sudo tee /etc/apt/sources.list.d/salt.list
deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/ubuntu/$(lsb_release -sr)/amd64/latest $(lsb_release -sc) main
EOF

# Install salt
sudo apt-get update -y \
&& sudo apt-get install -y \
   'git' \
   'libssl-dev' \
   'python3-pip' \
   'salt-minion'

# Configure salt
sudo cat <<EOF | /etc/salt/minion.d/00-local.conf
file_client: local
EOF

sudo systemctl enable salt-minion \
&& sudo systemctl restart salt-minion \
&& sudo python3 -m pip install --upgrade pip \
&& sudo pip3 install --no-cache-dir --upgrade \
   'pyopenssl' \
   'pylxd'
