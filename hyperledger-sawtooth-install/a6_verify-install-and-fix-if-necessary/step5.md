# Fix and validate

The issue seems to come from the second node `chsa-a6-01` node that does not run the `sawtooth-settings-tp` transaction processor service.

* Restart the missing service, then check inistal node Validator logs.

```bash
docker exec -it -u sysops chsa-a6-01 bash -c 'sudo systemctl restart sawtooth-settings-tp'
```{{execute}}

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo cat /var/log/sawtooth/validator-debug.log | grep interconnect'
```{{execute}}

```text

```

* Wait 20 seconds.

```bash

```


> **Notice**: `sawtooth-settings-tp` is not enabled nor running on this node.

```
sawtooth-intkey-tp-python.service           disabled
sawtooth-poet-validator-registry-tp.service disabled
sawtooth-rest-api.service                   enabled
sawtooth-settings-tp.service                disabled
sawtooth-validator.service                  enabled
sawtooth-xo-tp-python.service               disabled
sawtooth-rest-api.service       loaded active running Sawtooth REST API
sawtooth-validator.service      loaded active running Sawtooth Validator Server
```

* Check the list of enabled and running services from the third node.

```bash
docker exec -it -u sysops chsa-a6-01 bash -c 'sudo systemctl list-unit-files | grep sawtooth && sudo systemctl list-units | grep sawtooth'
```{{execute}}

```
awtooth-intkey-tp-python.service           disabled
sawtooth-poet-validator-registry-tp.service disabled
sawtooth-rest-api.service                   enabled
sawtooth-settings-tp.service                enabled
sawtooth-validator.service                  enabled
sawtooth-xo-tp-python.service               disabled
sawtooth-rest-api.service       loaded active running Sawtooth REST API
sawtooth-settings-tp.service    loaded active running Sawtooth TP Settings
sawtooth-validator.service      loaded active running Sawtooth Validator Server
```

> **Notice**: The third node seems aligned with the genesis node.

