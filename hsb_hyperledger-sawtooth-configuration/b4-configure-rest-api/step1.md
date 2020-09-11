# Step 1 - Connect REST API to Validator

The REST API service default configuration is designed to access the Validator on the same host.
The validator component address is enford by default by the REST API service environment file and has **precedence** over the configuration file.

* Open an interactive terminal session on the host that run the rest-api service.

```bash
docker exec -u sysops -it chsa-b4-02 bash
```{{ execute }}

* Edit the REST API environment file in order to change the Validator address.

```bash
sudo vim /etc/default/sawtooth-rest-api
```{{ execute }}

* Switch to insert mode by typing `i`{{execute no-newline}}, then change the `connect` address as described below.

```toml
SAWTOOTH_REST_API_ARGS=--connect tcp://chsa-b4-00:4004
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}
