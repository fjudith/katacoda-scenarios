# Step 2 - Configure remaining nodes

Remaining nodes will be configured remotetly to save time.

* Update the second node configuration.

```bash
docker exec -it -u sysops chsa-b9-01 bash -c '\
sudo -i "s/serial/parallel/g /etc/sawtooth/validator.toml && \
sudo systemctl restart sawtooth-validator
'
```{{execute}}

* Update the third node configuration.

```bash
docker exec -it -u sysops chsa-b9-02 bash -c '\
sudo -i "s/serial/parallel/g /etc/sawtooth/validator.toml && \
sudo systemctl restart sawtooth-validator
'
```{{execute}}