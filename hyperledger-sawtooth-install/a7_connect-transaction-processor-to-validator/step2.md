# Step 2 - Reconfigure local dependant services

It is also required to also change the configuration of `settings-tp` and `rest-api` services as the connect to the local host interface by default.
The Validator target is enforced by environment variable files located in `/etc/default`.

* Update the `sawtooth-settings-tp` service environment file.

```bash
sudo sed -i 's/localhost/chsa-a7-00/g' /etc/default/sawtooth-settings-tp
```{{execute}}

* Update the `sawtooth-rest-api` service environment file.

```bash
sudo sed -i 's/localhost/chsa-a7-00/g' /etc/default/sawtooth-rest-api
```{{execute}}

* Restart all local sawtooth services

```bash
sudo systemctl restart sawtooth-validator sawtooth-settings-tp sawtooth-rest-api
```{{execute}}

* Finally check that on-chain settings can be listed.

> This simple tests validate the communication between all the components running on the host

```bash
sawtooth settings list
```{{execute}}

```
sawtooth.settings.vote.authorized_keys: ...
```

* Exit the terminal session.

```bash
exit
```{{execute}}
