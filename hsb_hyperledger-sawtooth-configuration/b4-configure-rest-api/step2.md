# Step 2 - Expose the REST API to remote clients

The REST API is locally binded to the localhost IP adress by default (i.e. `127.0.0.1`).
Counter to the Validator, REST API **cannot** be bind on a network interface (e.g. `eth0`).

**Only** Hostname or IP adresses are supported.

* Copy the REST API configuration example.

```bash
sudo cp /etc/sawtooth/rest_api.toml.example /etc/sawtooth/rest_api.toml
```{{ execute }}

* Edit the REST API environment file in order to change the Validator address.

```bash
sudo vim /etc/sawtooth/rest_api.toml
```{{ execute }}

* Switch to insert mode by typing `i`{{execute no-newline}}, then change the `bind` address as described below.

```toml
# The port and host for the api to run on
bind = ["chsa-b4-02:8008"]
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}
