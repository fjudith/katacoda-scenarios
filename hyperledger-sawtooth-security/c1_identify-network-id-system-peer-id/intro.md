# Identify network ID / System / Peer ID

This exercise demonstrates how to discover the Sawtooth network component on-chain.

The stack includes the following hosts:

host | services
---- | --------
`chsa-c1-00` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-01` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-02` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-loadgen` | Intkey load generator

The `chsa-c1-00`, `chsa-c1-01` and `chsa-c1-02` are currently forming the network. The goal is to add the `chsa-c1-03` host.

The **influxdb/grafana** stack allows to quickly observe the effect on the network.
