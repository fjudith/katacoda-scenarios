# Step 2 - Configure the second node

The second will be configured manually.

* Open an interactive terminal session on the second node.

```bash
docker exec -u sysops -it chsa-b1-01 bash
```{{ execute }}

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/validator.toml
```

* Type `i` to activate the `-- INSTERT --` mode, then Change the values as described below.

```toml
...
bind = [
    "network:tcp://eth0:8800",
    "component:tcp://127.0.0.1:4004"
]
...
peering = "dynamic"
...
endpoint = "tcp://chsa-b1-01:8800"
...
seeds = ["tcp://chsa-b1-00:8800"]
...
```

* To save the change, type `ESC` > `:wq` > `Enter`.

* Enable and start required services

```bash
sudo systemctl enable sawtooth-validator sawtooth-settings-tp sawtooth-xo-tp-python sawtooth-rest-api && \
sudo systemctl start sawtooth-validator sawtooth-settings-tp sawtooth-xo-tp-python sawtooth-rest-api
```{{ execute }}

* Exit the terminal session.

```bash
exit
```{{ execute }}