# Step 1 - Check validator component interface

To much time as possible, it preferable to used remote commands instead of opening an interactive session if no configuration changes are expected on the node.
No Transaction processors configuration files will be added nor modified.
**Only** services environment files will be updated to save time. 


* Check validator configuration.

```bash
docker exec -u sysops -it chsa-b7-00 bash -c 'sudo grep "component:" /etc/sawtooth/validator.toml'
```{{ execute }}

```bash
  "component:tcp://eth0:54321"
```

## IntKey transaction processor

* Update the IntKey transaction processor

```bash
docker exec -u sysops -it chsa-b7-01 bash -c 'sudo sed -i "s/localhost:4004/chsa-b7-00:54321/g" /etc/default/sawtooth-intkey-tp-python'
```{{ execute }}

* Restart the service

```bash
docker exec -u sysops -it chsa-b7-01 bash -c 'sudo systemctl restart sawtooth-intkey-tp-python'
```{{ execute }}

## XO transaction processor

* Update the XO transaction processor

```bash
docker exec -u sysops -it chsa-b7-01 bash -c 'sudo sed -i "s/localhost:4004/chsa-b7-00:54321/g" /etc/default/sawtooth-xo-tp-python'
```{{ execute }}

* Restart the service

```bash
docker exec -u sysops -it chsa-b7-01 bash -c 'sudo systemctl restart sawtooth-xo-tp-python'
```{{ execute }}
