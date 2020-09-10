# Step 1 - Configure the genesis node

The configuration of new PoET enabled network requires to:

1. Create a Genesis block that include the consensus settings.
2. Run the additionnal `sawtooth-poet-validator-registry-tp` service.

* Open an interactive terminal session on the genesis node.

```bash
docker exec -u sysops -it chsa-b2-00 bash
```{{ execute }}

* Check the Registry transaction processor service availability.

```bash
sudo systemctl list-unit-files | grep registry-tp
```{{ execute }}

> **Notice**: The `sawtooth-poet-validator-registry-tp` service comes at part of the `sawtooth` package installation.

```bash
sawtooth-poet-validator-registry-tp.service disabled
```

* Create Validator key-pair.

```bash
sudo sawadm keygen
```{{ execute }}

```bash
writing file: /etc/sawtooth/keys/validator.priv
writing file: /etc/sawtooth/keys/validator.pub
```

* Create the PoET genesis batch using the **sawtooth** user in `/tmp`.

```bash
sudo -u sawtooth poet registration create -k /etc/sawtooth/keys/validator.priv \
-o /tmp/poet.batch
```{{ execute }}

* Create the Settings proposal batch.

```bash
sudo sawset proposal create -k /etc/sawtooth/keys/validator.priv \
sawtooth.consensus.algorithm=poet \
sawtooth.poet.report_public_key_pem=$(cat /etc/sawtooth/simulator_rk_pub.pem) \
sawtooth.poet.valid_enclave_measurements=$(poet enclave measurement) \
sawtooth.poet.valid_enclave_basenames=$(poet enclave basename) \
-o config.batch
```{{ execute }}

* Create the genesis batch.

```bash
sudo sawset genesis --key /etc/sawtooth/keys/validator.priv \
-o config-genesis.batch
```{{ execute}}

* Create the genesis block.

```bash
sudo sawadm genesis /tmp/poet.batch config.batch config-genesis.batch
```

```bash

```

* Create the 