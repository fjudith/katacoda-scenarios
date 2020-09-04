# Step 2 - Configure the second node

The second node needs to be configured in order to collect the list of peers from `chsa-a5-00`. 

* Open an interactive shell session in `chsa-a5-01`.

```bash
docker exec -it -u sysops chsa-a5-01 bash
```{{execute}}

* Add the following line to the Validator service environment file `/etc/default/sawtooth-validator`.

```bash
echo "SAWTOOTH_VALIDATOR_ARGS=--peering dynamic --bind network:tcp://eth0:8800 --endpoint tcp://chsa-a5-01:8800 --seed tcp://chsa-a5-00:8800" | sudo tee -a /etc/default/sawtooth-validator
```{{ execute }}

* Enable and start required services.

```bash
sudo systemctl enable sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
sudo systemctl start sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
```{{ execute }}

* Close the terminal session to switch to the third node configuration.

```bash
exit
```{{ execute }}