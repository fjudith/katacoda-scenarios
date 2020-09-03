# Step 1 - Generate Validator key-pair

Run the following command to open an interactive shell session in the `chsa-a3-00` container.

```bash
docker exec -it -u sysops chsa-a3-00 bash
```{{execute}}

* Create Validator keys-pair.

```bash
sudo -u sawtooth sawadm keygen
```{{ execute }}

```text
writing file: /etc/sawtooth/keys/validator.priv
writing file: /etc/sawtooth/keys/validator.pub
```
