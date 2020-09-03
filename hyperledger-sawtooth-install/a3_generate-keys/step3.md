# Step 3 - Enable, start and check services startup

User key-pair is also known as **Transaction Signer** keys .

* Geneate user public and private keys

```bash
sawtooth keygen --key-dir "/home/sysops/.sawtooth/keys/" sysops
```{{execute}}

> Notice: Sawtooth Validator **failed** to start because validator keys and genesis bloc were not generated in the scenario.

```text
writing file: /home/sysops/.sawtooth/keys/sysops.priv
writing file: /home/sysops/.sawtooth/keys/sysops.pub
```
