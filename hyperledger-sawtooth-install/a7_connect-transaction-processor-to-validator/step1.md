# Step 1 - Expose the Validator component interface

By default the component interface listens locally. It is then required to bind it on a network interface to allow transaction processor to establish connection.

* Open an interactive shell session in `chsa-a7-00`.

```bash
docker exec -it -u sysops chsa-a7-00 bash
```{{execute}}

* Edit the Validator configuration file

```bash
sudo vim /etc/sawtooth/validator.toml
```{{execute}}

* Switch to insert mode by typing `i`{{execute no-newline}}, , then change the values as described below.

```toml
...
bind = [
    "network:tcp://127.0.0.1:8800",
    "component:tcp://eth0:4004"
]
...
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To exit, type `:q!`{{execute}}
