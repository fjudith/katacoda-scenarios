#!/bin/bash

set -e

sudo systemctl enable sawtooth-intkey-tp-python
sudo systemctl enable sawtooth-xo-tp-python

sudo sed -i 's/localhost/$(hostname)/g' /etc/default/sawtooth-intkey-tp-python
sudo sed -i 's/localhost/$(hostname)/g' /etc/default/sawtooth-xo-tp-python

exec "$@"