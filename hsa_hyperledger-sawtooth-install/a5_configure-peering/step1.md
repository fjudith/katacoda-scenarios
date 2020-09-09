# Step 1 - Configure the genesis node

The genesis node (i.e. that created the genesis block) is currently configured to run all services locally.

* Open an interactive shell session in `chsa-a5-00`.

```bash
docker exec -it -u sysops chsa-a5-00 bash
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
endpoint = "tcp://chsa-a5-00:8800"
...
```

* To save the change, type `ESC` > `:wq` > `Enter`, then restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{ execute }}

* Close the terminal session to switch to the second node configuration.

```bash
exit
```{{ execute }}
