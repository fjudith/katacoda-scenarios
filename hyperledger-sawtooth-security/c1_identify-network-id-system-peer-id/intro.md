# Validator registration

This exercise demonstrates how to add a Validator in an existing network governed by policies.

The stack includes the following hosts:

host | services
---- | --------
`chsa-a4-00` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c4-01` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c4-02` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c4-influxdb` | InfluxDB time series database
`chsa-c4-grafana` | Grafana monitoring (u:admin/p:admin)
`chsa-c4-loadgen` | Intkey load generator

The `chsa-c4-00`, `chsa-c4-01` and `chsa-c4-02` are currently forming the network. The goal is to add the `chsa-c4-03` host.

The **influxdb/grafana** stack allows to quickly observe the effect on the network.
