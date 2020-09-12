# Step 1 - Configure the genesis node

The parallel scheduling can be configured only off-chain.
It is the required to update the Validator configuration and restart de associated service.

* Open an interactive shell session in `chsa-b9-00`.

```bash
docker exec -it -u sysops chsa-b9-00 bash
```{{execute}}

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/validator.toml
```{{execute}}

* Switch to insert mode by typing `i`{{execute no-newline}}, then change the values as described below.

```toml
scheduler = 'parallel'
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}

* Restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{ execute }}
