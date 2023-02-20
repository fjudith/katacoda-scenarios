#!/usr/bin/env bash

# install lxc and lxd
function install_dependencies()
{
    sudo apt-get update -y \
    && apt-get install -y \
       'lxc' \
       'lxd' \
       'python3-pylxd' \
       'python3-openssl'
}

function configure_veth()
{
    echo "$(id -un) veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
}

function configure_lxc()
{
    mkdir -p ~/.config/lxc

    cp /etc/lxc/default.conf ~/.config/lxc/default.conf
    MS_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 2)"
    ME_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 3)"
    MS_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 2)"
    ME_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 3)"

    echo "lxc.idmap = u 0 $MS_UID $ME_UID" >> ~/.config/lxc/default.conf
    echo "lxc.idmap = g 0 $MS_GID $ME_GID" >> ~/.config/lxc/default.conf

    export DOWNLOAD_KEYSERVER="hkp://keyserver.ubuntu.com"
}

install_dependencies
configure_veth
configure_lxc