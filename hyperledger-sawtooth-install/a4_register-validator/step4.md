
# Step 4 - Check and update Validator peering

The `chsa-a4-00` Validator is the only host to run the REST API service and own the `sysops` key-pair.
Thus all checks have to be performed from it.

* Open an interactive shell session in `chsa-a4-00`.

```bash
docker exec -it -u sysops chsa-a4-00 bash
```{{execute}}

* Check the list of Peer using the `sawtooth` CLI.

```bash
sawtooth peer list
```{{execute}}

> **Notice**: Only the `chsa-a4-01` appears.

```text
tcp://chsa-a4-01:8800,tcp://chsa-a4-01:8800
```

Sawtooth peering mode is `static` by default, meaning that the list of peers must inserted in the Validator configuration file.

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/validator.toml
```{{execute}}

* Type `i` to activate the `-- INSTERT --` mode, then Change the values as described below.

```toml
...
peers = ["tcp://chsa-a4-01:8800","tcp://chsa-a4-02:8800"]
...
```

* To save the change, type `ESC` > `:wq` > `Enter`, then restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{execute}}

* Check the list of peers.

```bash
sawtooth peer list
```{{execute}}

> **Notice**: Peer communication is now established with `chsa-a4-02`.

```text
tcp://chsa-a4-02:8800,tcp://chsa-a4-01:8800,tcp://chsa-a4-01:8800
```

* Exit the terminal session as `chsa-a4-01` peer list also need an update.

```bash
exit
```{{execute}}