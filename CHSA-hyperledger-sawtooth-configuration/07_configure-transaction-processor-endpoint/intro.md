# Configure transaction processor endpoint

This exercise demonstrates the how to configure transaction processors to connect to a remote Validator component interface.

The stack includes the following hosts:

host | services | status
---- | -------- | ------
`chsa-b7-00` | `validator`, `settings-tp` and `rest-api` | **Running**
`chsa-b7-01` | `intkey-tp-python` and `xo-tp-python` | **Running**

Services running on `chsa-b7-01` are currently unable to connect to the remote validator.

The goal is to discover the validator configuration and fix the transaction processors as fast as possible.
