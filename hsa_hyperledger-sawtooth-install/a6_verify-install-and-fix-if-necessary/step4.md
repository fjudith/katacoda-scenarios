# Check services consistency (2)

The `validator`, `settings-tp` and `rest-api` services are enabled on the genesis node (i.e. `chsa-a6-00`).
Let's discover the status of the other peers.

* Check the list of enabled and running services from the second node.

```bash
docker exec -it -u sysops chsa-a6-01 bash -c 'sudo systemctl list-unit-files | grep sawtooth && sudo systemctl list-units | grep sawtooth'
```{{execute}}

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
docker exec -it -u sysops chsa-a6-02 bash -c 'sudo systemctl list-unit-files | grep sawtooth && sudo systemctl list-units | grep sawtooth'
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
