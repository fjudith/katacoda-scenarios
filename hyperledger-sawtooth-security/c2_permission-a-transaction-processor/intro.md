# Permission a transaction processor

This exercise demonstrates how to enabled a transaction processor in a permissionned Sawtooth network.

The stack includes the following hosts:

host | services
---- | --------
`chsa-c2-00` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c2-01` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c2-02` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c2-loadgen` | Intkey load generator

The `chsa-c2-loadgen` currently raise the following error messages repeatedly.

```
Running command: intkey set QOul667n 22173 --url "http://chsa-c2-00:8008"
Error: Error 400: Bad Request
...
Running command: intkey set csLm9Xdy 17854 --url "http://chsa-c2-01:8008"
Error: Error 400: Bad Request
...
Running command: intkey set xvSsv0DP 16021 --url "http://chsa-c2-02:8008"
Error: Error 400: Bad Request
```

The goal is to setup permit the load generator using the off-chain method (i.e. Using static configuration files).
