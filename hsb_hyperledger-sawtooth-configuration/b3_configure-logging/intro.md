# Configure logging

This exercise demonstrates how to configure logging outputs of the Validator services.

The stack includes the following host:

host | services | status
---- | -------- | ------
`chsa-b3-00` | `validator`,`settings-tp`, `intkey-tp-python`, `rest-api` and `rsyslog` | **Running**

The goal is to redirect logs to the local **Rsyslog** service.
