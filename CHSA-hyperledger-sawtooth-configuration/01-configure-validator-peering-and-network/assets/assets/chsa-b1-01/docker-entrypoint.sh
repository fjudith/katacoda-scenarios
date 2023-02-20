#!/bin/bash

set -e

if [ ! -f /etc/sawtooth/keys/validator.priv ]; then
    sudo sawadm keygen
fi

exec "$@"