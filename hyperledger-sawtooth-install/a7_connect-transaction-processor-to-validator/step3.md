# Step 3 - Configure the Intkey transaction processor

The IntKey process does not leverage a configuration file like other services. It instead **only** use an environmnet file located int the `/etc/default` directory.

The host will be configured without opening an interactive terminal session to accelerate the host configuration.

* Open an interactive shell session in `chsa-a7-01`.

```bash
docker exec -u sysops chsa-a7-01 bash -c 'sudo sed -i "s/localhost/chsa-a7-00/g" /etc/default/sawtooth-intkey-tp-python'
```{{execute}}

* Enable the service automatic startup

```bash
docker exec -u sysops chsa-a7-01 bash -c 'sudo systemctl enable sawtooth-intkey-tp-python'
```{{execute}}

* Start the service

```bash
docker exec -u sysops chsa-a7-01 bash -c 'sudo systemctl start sawtooth-intkey-tp-python'
```{{execute}}

* Check the service registration

```bash
docker exec -u sysops chsa-a7-01 bash -c 'sudo journalctl -u sawtooth-intkey-tp-python'
```{{execute}}

```
Sep 07 17:25:27 chsa-a7-01 intkey-tp-python[86]: [2020-09-07 17:25:27.023 INFO     core] register attempt: OK
```
