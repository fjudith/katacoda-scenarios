# Create genesis block

This exercise demontrates how to generate the genesis block containing the settings of the blockchain.

The stack includes the single host `chsa-a8-00` and run the following services.

Service | Role
------- | ----
`sawtooth-validator` | Sawtooth network main component.
`sawtooth-settings-tp` | Transaction processor providing methodology for storing on-chain configuration settings.
`sawtooth-rest-api` | Client endpoint to  running validator, submit batches, and query the state of the ledger.

The Validator service reports the following error messages.

```
18:47:53.975 [MainThread] genesis DEBUG] genesis_batch_file: not found
[18:47:53.975 [MainThread] genesis DEBUG] block_chain_id: not yet specified
[18:47:53.975 [MainThread] genesis INFO] No chain head and not the genesis node: starting in peering mode
```

The goal is to create the genesis block in order to start the validator properly.
