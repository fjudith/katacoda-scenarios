# Connect transaction processor to validator

This exercise demontrates how to connect Transactions Processor running on third party hosts to a validator.

The stack include the following hosts:

host | services
---- | --------
`chsa-a7-00` | `validator`, `settings-tp` and `rest-api`
`chsa-c7-01` | Where the `intkey` transaction processor will be configured
`chsa-c7-02` | Where the `xo` transaction processor will be configured

Sawtooth packages are already installed on all hosts, but running only on `chsa-a7-00`.

The goal is to register both transactions processors in the validator.