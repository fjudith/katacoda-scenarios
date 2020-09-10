# Install Sawtooth Packages

This exercise demonstrates how to configure a Hyperledger Sawtooth network using **dynamic** peering.

The stack includes the following hosts:

host | services | status
---- | -------- | ------
`chsa-b1-00` | `validator`,`settings-tp`, `xo-tp-python` and `rest-api` | Running
`chsa-b1-01` | `validator`,`settings-tp`, `xo-tp-python` and `rest-api` | Installed
`chsa-b1-02` | `validator`,`settings-tp`, `xo-tp-python` and `rest-api` | Installed

The goal is to add the two remaining nodes to the network.
