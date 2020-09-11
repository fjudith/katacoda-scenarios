# Step 2 - Configure and start the Validator service

The PoET consensus works with either `static` or `dynamic` peering modes.
The **dynamic** peering will be used as it is faster to setup.

* Edit the Validator configuration in order to expose it on the network

```bash
sudo vim /etc/sawtooth/validator.toml
```{{ execute }}

* Switch to insert mode by typing `i`{{execute no-newline}}, then change the values as described below.

```toml
...
bind = [
    "network:tcp://eth0:8800",
    "component:tcp://127.0.0.1:4004"
]
...
peering = "dynamic"
...
endpoint = "tcp://chsa-b2-00:8800"
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}

* Enable and start the required services.

```bash
SVC="sawtooth-validator \
sawtooth-settings-tp \
sawtooth-poet-validator-registry-tp \
sawtooth-rest-api \
sawtooth-intkey-tp-python" && \
sudo systemctl enable ${SVC} && \
sudo systemctl start ${SVC}
```{{ execute }}

* Exit the terminal session.

```bash
exit
```{{ execute }}