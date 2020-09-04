# Step 1 - Configure the initial node

The initial node (i.e. that created the genesis block) is currently configured to run all services locally.

* Open an interactive shell session in `chsa-a5-00`.

```bash
docker exec -it -u sysops chsa-a5-00 bash
```{{execute}}

* Add the following line to the Validator service environment file `/etc/default/sawtooth-validator`.

```bash
echo "SAWTOOTH_VALIDATOR_ARGS=--peering dynamic --bind network:tcp://eth0:8800 --endpoint tcp://chsa-a5-00:8800" | sudo tee -a /etc/default/sawtooth-validator
```{{ execute }}

* Restart the `sawtooth-validator` service.

```bash
sudo systemctl restart sawtooth-validator
```{{ execute }}

* Close the terminal session to switch to the second node configuration.

```bash
exit
```{{ execute }}
