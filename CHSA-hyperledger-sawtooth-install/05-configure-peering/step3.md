# Step 3 - Configure the third node

The third node needs to be configured in same way as the `chsa-a5-01`. Expect the `endpoint` that need to be changed.

* Open an interactive shell session in `chsa-a5-02`.

```bash
docker exec -it -u sysops chsa-a5-02 bash
```{{execute}}

* Create Validator key-pair

```bash
sudo sawadm keygen
```{{execute}}

* Change the settings in the Validator configuration file `/etc/sawtooth/validator.toml`.

```bash
sudo vim /etc/sawtooth/validator.toml
```{{execute}}

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
endpoint = "tcp://chsa-a5-02:8800"
...
seeds = ["tcp://chsa-a5-00:8800"]
...
```

* To save the change, type `ESC` > `:wq` > `Enter`, then restart the Validator service.

```bash
sudo systemctl enable sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
sudo systemctl start sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
```{{ execute }}

* Close the terminal session to switch to the genesis node for peering checks.

```bash
exit
```{{ execute }}
