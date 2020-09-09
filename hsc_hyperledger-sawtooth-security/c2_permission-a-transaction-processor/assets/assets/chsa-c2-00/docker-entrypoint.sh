#!/bin/bash

set -e

if [ ! -f /etc/sawtooth/keys/validator.priv ]; then
    sudo sawadm keygen
fi

mkdir -p /home/${USER}/.sawtooth/keys

if [ ! -f /home/${USER}/.sawtooth/keys/${USER}.priv ]; then
    sudo sawtooth keygen --key-dir /home/${USER}/.sawtooth/keys ${USER}
    sudo chown ${USER}:${USER} /home/${USER}/.sawtooth/keys/${USER}.p*
fi

# sudo sawset genesis --key /home/${USER}/.sawtooth/keys/${USER}.priv
# sudo sawadm genesis config-genesis.batch

if [ ! -f config-genesis.batch ]; then
    sudo sawset genesis --key /etc/sawtooth/keys/validator.priv \
    -o config-genesis.batch
fi

if [ ! -f /var/lib/sawtooth/config.batch ]; then
    sudo sawadm genesis config-genesis.batch
fi

sudo systemctl enable sawtooth-validator
sudo systemctl enable sawtooth-settings-tp
sudo systemctl enable sawtooth-rest-api

sudo systemctl enable sawtooth-intkey-tp-python
sudo systemctl enable sawtooth-xo-tp-python

sudo sed -i "s/#\(SAWTOOTH_VALIDATOR_ARGS=\)/\1-vv/g"  /etc/default/sawtooth-validator

sudo mkdir -p /etc/sawtooth/policy
sudo touch /etc/sawtooth/policy/policy.example

cat << EOF | sudo tee -a /etc/sawtooth/policy/policy.example
PERMIT_KEY $(cat /home/${USER}/.sawtooth/keys/${USER}.pub)
DENY_KEY *
EOF
sudo chown sawtooth:sawtooth /etc/sawtooth/policy/policy.example

exec "$@"