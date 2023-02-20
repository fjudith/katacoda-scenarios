#!/usr/bin/env bash

# install lxc and lxd
function install_dependencies()
{
    sudo apt-get update -y \
    && apt-get install -y \
       'lsb-release' \
       'openssh-server' \
       'lxc' \
       'lxd' \
       'python3-pylxd' \
       'python3-openssl'
}

function configure_veth()
{
    lxc-checkconfig
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

    if [ "$(id -un)" = "root" ]
    then
        echo "lxc.idmap = u 0 $MS_UID $ME_UID" | sudo tee -a /etc/lxc/default.conf
        echo "lxc.idmap = g 0 $MS_GID $ME_GID" | sudo tee -a /etc/lxc/default.conf
    else
        echo "lxc.idmap = u 0 $MS_UID $ME_UID" | tee -a ~/.config/lxc/default.conf
        echo "lxc.idmap = g 0 $MS_GID $ME_GID" | tee -a ~/.config/lxc/default.conf
    
    fi
    export DOWNLOAD_KEYSERVER="hkp://keyserver.ubuntu.com"
}

function start_containers()
{
    if [ "$(id -un)" = "root" ]
    then
        sudo lxc-create --template download --name host02 -- --dist ubuntu --release DISTRO-SHORT-CODENAME --arch amd64
    else
        systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-create --template download --name host02 -- --dist ubuntu --release DISTRO-SHORT-CODENAME --arch amd64
    fi
}

install_dependencies
configure_veth
configure_lxc