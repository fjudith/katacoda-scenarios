# Identify network ID / System / Peer ID

This exercise demonstrates how to discover the Sawtooth network component on-chain.

The stack includes the following hosts:

host | services
---- | --------
`chsa-c1-00` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-01` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-02` | `validator`, `identity-tp`, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c1-loadgen` | Intkey load generator

**Notice**: The load generator sends request only to `chsa-c1-00` to demonstrate how Sawtooth distribute the load accross nodes from a single point of entry. 

The goal is retro-architecture the network topology using a top down approach.
