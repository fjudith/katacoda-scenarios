# Configure metrics

This exercise demonstrates how to send metrics to a central monitoring infrastructure.

The stack includes the following hosts:

host | services
---- | --------
`chsa-b6-00` | `validator`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-b6-influxdb` | InfluxDB time series database
`chsa-b6-grafana` | Grafana monitoring (u:admin/p:password)
`chsa-b6-loadgen` | Intkey load generator

The goal is to configure both **Validator** and **REST API** services to push metrics to a remote time series database.

> **Notice**: Telegraf is already configured to push hardware related metrics.