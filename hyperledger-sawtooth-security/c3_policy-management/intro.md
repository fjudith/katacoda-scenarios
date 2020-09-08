# Permission a transaction processor

This exercise demonstrates how to leverage the Identity transaction in a permissionned Sawtooth network.

The stack includes the following hosts:

host | services
---- | --------
`chsa-c3-00` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-01` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-02` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-loadgen` | Intkey load generator

The because Sawtooth network permits any source of transactions out of the box, `chsa-c3-loadgen` is currently able to successfully generate requests to all nodes.

```
Running command: intkey set QOul667n 22173 --url "http://chsa-c3-00:8008"
Error: Error 400: Bad Request
...
Running command: intkey set csLm9Xdy 17854 --url "http://chsa-c3-01:8008"
Error: Error 400: Bad Request
...
Running command: intkey set xvSsv0DP 16021 --url "http://chsa-c3-02:8008"
Error: Error 400: Bad Request
```

The goal is to install the `identity-tp` transaction processor to restrict the load-generator using the **on-chain** method.
