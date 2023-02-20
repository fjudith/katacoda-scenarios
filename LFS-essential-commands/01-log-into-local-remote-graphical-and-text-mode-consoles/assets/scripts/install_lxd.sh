#!/usr/bin/env bash

# install lxc and lxd
function install_dependencies()
{
    sudo apt-get update -y \
    && apt-get install -y \
       'lsb-release' \
       'lxd' \
       'python3-pylxd' \
       'python3-openssl'
}

function configure_veth()
{
    lxc-checkconfig
    echo "$(id -un) veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
}

# Initialize LXD
function configure_lxd()
{
    export DOWNLOAD_KEYSERVER="hkp://keyserver.ubuntu.com"

    sudo lxd init --auto
    
}

function start_containers()
{
    DISTRIBUTION=$(lsb_release -is)
    RELEASE=$(lsb_release -cs)

    chmod +x ~/ ~/.local ~/.local/share ~/.local/share/lxc

    if [ "$(id -un)" = "root" ]
    then
        CONTAINER_NAME='host02'
        lxc launch "${DISTRIBUTION}:${RELEASE}" "${CONTAINER_NAME}" --config=user.user-data="$(cat /tmp/default-user-data.yml)"
    fi
}

install_dependencies
configure_veth
configure_lxd
start_containers
