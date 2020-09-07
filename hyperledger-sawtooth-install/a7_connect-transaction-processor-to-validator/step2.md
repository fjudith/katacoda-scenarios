# Step 2 - Reconfigure local dependant services

It is required to also change the configuration of `settings-tp` and `rest-api` services as the connect to the local host interface by default.

* Create the `settings.toml` configuration file with appropriate permissions.

```bash
echo connect = "tcp://chsa-a7-00:4004" | sudo tee -a /etc/sawtooth/settings.toml && \
sudo chown root:sawtooth /etc/sawtooth/settings.toml
```{{execute}}

* Create the `rest_api.toml` configurtaion file.

```bash
echo connect = "tcp://chsa-a7-00:4004" | sudo tee -a /etc/sawtooth/rest_api.toml && \
sudo chown root:sawtooth /etc/sawtooth/rest_api.toml
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
tbc
```

* Exit the terminal session.

```bash
exit
```{{execute}}
