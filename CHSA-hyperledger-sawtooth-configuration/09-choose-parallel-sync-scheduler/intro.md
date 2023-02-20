# Choose parallel sync scheduler

This exercise demontrates how parallel sync scheduler can improve the performance of a sawtooth network.

The stack includes the following hosts:

host | services
---- | --------
`chsa-b9-00` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-b9-01` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-b9-02` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-b9-influxdb` | InfluxDB time series database
`chsa-b9-grafana` | Grafana monitoring (u:admin/p:password)
`chsa-b9-loadgen` | Intkey load generator

The load generator is frequently raising the following error message.

```bash
Error: Error 429: Too Many Requests
Writing to batches.intkey...
[01:28:05 WARNING load] (429): Too Many Requests
```

The goal is to activate parallel scheduling in order to enable seamless transaction submission from the load generator.
 
