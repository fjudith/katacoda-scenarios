#!/usr/bin/env bash
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
    SSH_KEY_FILE="${HOME}/.ssh/id_rsa_${USER_NAME}"

    if [ -f "${SSH_KEY_FILE}" ]; then
        ssh-keygen -f "${SSH_KEY_FILE}" -C "${USER_NAME}@${HOST_NAME}" -q -N ''
    fi
}

function udpate_user_data()
{
    SSH_KEY_FILE="${HOME}/.ssh/id_rsa_${USER_NAME}"
    
    if [ -f "/tmp/default-user-data.yml" ]; then
        sed -i "s/__USER_SSH_PUBLIC_KEY__/$(cat $SSH_KEY_FILE)/g" /tmp/default-user-data.yml
    fi
}

install_dependencies
generate_keys
udpate_user_data