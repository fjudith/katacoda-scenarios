# Step 2 - Configure the validator

Sawtooth installation pachage provides various configuration examples in the `/etc/sawtooth` directory.
By defaut these configuration are configured only for local component communications.

Since the Validator needs to access the network, we must expose the `network` and `endpoint` to enable connectivity with other validators.

* Copy the validator configuration example file.

```bash
sudo -u sawtooth cp /etc/sawtooth/validator.toml.example /etc/sawtooth/validator.toml
```{{execute}}

* Edit the Validator configuration file in order to:

1. Expose the validator
    * Change the `network` listening interface
    * Change the `endpoint` listening insterface
2. Fill the list of network `peers`.

```toml
...
# Bind is used to set the network and component endpoints. It should be a list
# of strings in the format "option:endpoint", where the options are currently
# network and component.
bind = [
    "network:tcp://eth0:8800",
    "component:tcp://127.0.0.1:4004"
]
...
# Advertised network endpoint URL.
endpoint = "tcp://127.0.0.1:8800"
...
# A list of peers to attempt to connect to in the format tcp://hostname:port.
# It defaults to None.
peers = ["tcp://chsa-a4-00:8800","tcp://chsa-a4-01:8800"]
...
```{{ execute }}

* Save changes `<ESC>` > `wq` > <Enter>.