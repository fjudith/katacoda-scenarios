# Check services consistency

Hyperledger Sawtooth network is considered as stable only if all participant are running the same set of transaction processors.
It is viable then to check if all hosts are running similar services.

* Check the list of enabled services from the initial node.

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo systemctl list-unit-files | grep sawtooth'
```{{execute}}

```
sawtooth-intkey-tp-python.service           disabled
sawtooth-poet-validator-registry-tp.service disabled
sawtooth-rest-api.service                   enabled
sawtooth-settings-tp.service                enabled
sawtooth-validator.service                  enabled
sawtooth-xo-tp-python.service               disabled
```

* Then check the list of running services

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo systemctl list-units | grep sawtooth'
```{{execute}}

```
sawtooth-rest-api.service       loaded active running Sawtooth REST API
sawtooth-settings-tp.service    loaded active running Sawtooth TP Settings
sawtooth-validator.service      loaded active running Sawtooth Validator Server
```

> **Notice**: All enabled service are running.
