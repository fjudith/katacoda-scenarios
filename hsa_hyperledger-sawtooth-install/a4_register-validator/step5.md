
# Step 5 - Update Validator peering for full network mesh

The `chsa-a4-01` Validator configuration needs to be updated in order to form a full network mesh.

* Open an interactive shell session in `chsa-a4-01`.

```bash
docker exec -it -u sysops chsa-a4-01 bash
```{{execute}}

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/validator.toml
```{{execute}}

* Type `i` to activate the `-- INSTERT --` mode, then Change the values as described below.

```toml
...
peers = ["tcp://chsa-a4-00:8800","tcp://chsa-a4-02:8800"]
...
```

* To save the change, type `ESC` > `:wq` > `Enter`, then restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{execute}}

* Exit the terminal session as `chsa-a4-01` peer list also need an update.

```bash
exit
```{{execute}}