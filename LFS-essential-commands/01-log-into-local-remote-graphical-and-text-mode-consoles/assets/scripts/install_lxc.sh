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

    if [ ! "$(id -un)" = "root" ]
    then
        MS_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 2)"
        ME_UID="$(grep "$(id -un)" /etc/subuid  | cut -d : -f 3)"
        MS_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 2)"
        ME_GID="$(grep "$(id -un)" /etc/subgid  | cut -d : -f 3)"

        echo "lxc.idmap = u 0 $MS_UID $ME_UID" | tee -a ~/.config/lxc/default.conf
        echo "lxc.idmap = g 0 $MS_GID $ME_GID" | tee -a ~/.config/lxc/default.conf
    fi

    export DOWNLOAD_KEYSERVER="hkp://keyserver.ubuntu.com"
}

function start_containers()
{
    DISTRIBUTION=$(lsb_release -is)
    RELEASE=$(lsb_release -cs)
    
    chmod +x ~/ ~/.local ~/.local/share ~/.local/share/lxc

    if [ "$(id -un)" = "root" ]
    then
        sudo lxc-create --template download --name host02 -- --dist ${DISTRIBUTION,,} --release "${RELEASE}" --arch amd64 \
        && sudo lxc-start host02 \
        && sudo lxc-info host02 -iH
    else
        systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-create --template download --name host02 -- --dist ${DISTRIBUTION,,} --release "${RELEASE}" --arch amd64 \
        && lxc-start --name host02 \
        && lxc-info --name host02 --ips --no-humanize
    fi
}

install_dependencies
configure_veth
configure_lxc
start_containers
