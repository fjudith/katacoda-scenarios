# Configure REST API

This exercise demonstrates the how to configure the REST API to serve external clients.

The stack includes the following hosts:

host | services | status
---- | -------- | ------
`chsa-b4-00` | `validator` and `settings-tp` | **Running**
`chsa-b4-01` | `intkey-tp-python` and `xo-tp-python` | **Running**
`chsa-b4-02` | `rest-api` | Installed

The goal is to connect the `rest-api` service to the validator and expose it to remote clients.
