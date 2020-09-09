# Step 1 - Create the genesis block

Creation of the genesis block requires at least the Validator key-pair to be already available.
However it is possible to leverage the user key-pair, prefer the **use Validator keys** as only those are able to setup the PoET consensus.

* Open an interactive shell session in `chsa-a8-00`.

```bash
docker exec -it -u sysops chsa-a8-00 bash
```{{execute}}

* Create the settings batch

```bash
sudo sawset genesis -k /etc/sawtooth/keys/validator.priv
```{{execute}}

> **Notice**: By default the settings batch file is generated in the current directory.

```
Generated config-genesis.batch
```

* Create the Genesis block from the settings batch

```bash
sudo sawadm genesis config-genesis.batch
```{{execute}}


* Restart the Validator service

```bash
sudo systemctl restart sawtooth-validator
```{{execute}}
