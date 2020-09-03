
# Step 3 - Enable, start and check services startup

User key-pair is also known as **Transaction Signer** keys.

* Enable base services.

```bash
sudo systemctl enable \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api
```{{execute}}

* Start base services.

```bash
sudo systemctl start \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api
```{{execute}}

* Check services logs.

```bash
sudo journalctl start \
-u sawtooth-validator \
-u sawtooth-settings-tp \
-u sawtooth-rest-api
```{{execute}}

> Notice: Sawtooth Validator **failed** genesis block was not generated in the scenario.

```text
writing file: /home/sysops/.sawtooth/keys/sysops.priv
writing file: /home/sysops/.sawtooth/keys/sysops.pub
```