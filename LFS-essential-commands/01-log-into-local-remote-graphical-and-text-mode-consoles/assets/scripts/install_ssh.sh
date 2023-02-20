#!/usr/bin/env bash
set -e

function install_dependencies()
{
    sudo apt-get update -y \
    && apt-get install -y \
       'openssh-server'
}

function generate_keys()
{
    USER_NAME=$(id -un)
    HOST_NAME=$(hostname)
    if [ ! "$(id -un)" = "root" ]
    then
        SSH_KEY_FILE="${HOME}/.ssh/id_rsa"
    else
        SSH_KEY_FILE="/root/.ssh/id_rsa"
    fi
    

    if [ -f "${SSH_KEY_FILE}" ]; then
        ssh-keygen -f "${SSH_KEY_FILE}" -C "${USER_NAME}@${HOST_NAME}" -q -N ''
    fi
}

function udpate_user_data()
{
    if [ ! "$(id -un)" = "root" ]
    then
        SSH_PUB_KEY_FILE="${HOME}/.ssh/id_rsa.pub"
    else
        SSH_PUB_KEY_FILE="/root/.ssh/id_rsa.pub"
    fi
    
    if [ -f "/tmp/default-user-data.yml" ] && [ -f "${SSH_PUB_KEY_FILE}" ]; then
        sed -i "s|__USER_SSH_PUBLIC_KEY__|$(cat $SSH_PUB_KEY_FILE)|g" /tmp/default-user-data.yml
    fi
}

install_dependencies
generate_keys
udpate_user_data
