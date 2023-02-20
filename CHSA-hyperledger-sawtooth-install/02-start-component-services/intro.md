# Start component services

This exercise demonstrates how to run Sawtooth using Systemd tools `systemctl` and `journalctl`.

Only the following base services will be started.

Service | Role
------- | ----
`sawtooth-validator` | Sawtooth network main component.
`sawtooth-settings-tp` | Transaction processor providing methodology for storing on-chain configuration settings.
`sawtooth-rest-api` | Client endpoint to  running validator, submit batches, and query the state of the ledger

