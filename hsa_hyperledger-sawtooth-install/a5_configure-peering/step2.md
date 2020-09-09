# Step 2 - Configure the second node

The second node needs to be configured in order to collect the list of peers from `chsa-a5-00`. 

* Open an interactive shell session in `chsa-a5-01`.

```bash
docker exec -it -u sysops chsa-a5-01 bash
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
endpoint = "tcp://chsa-a5-01:8800"
...
seeds = ["tcp://chsa-a5-00:8800"]
...
```

* To save the change, type `ESC` > `:wq` > `Enter`, then restart the Validator service.

```bash
sudo systemctl enable sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
sudo systemctl start sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
```{{ execute }}

* Close the terminal session to switch to the third node configuration.

```bash
exit
```{{ execute }}
