# Very system meets hardware requirements

A single node network has a limited resource footprint.
But it is commonly accepted that a production network should at least own 2 CPUs and 4GB of RAM. 

The stack includes the single host `chsa-a9-00` and run the following services.

Service | Role
------- | ----
`sawtooth-validator` | Sawtooth network main component.
`sawtooth-settings-tp` | Transaction processor providing methodology for storing on-chain configuration settings.
`sawtooth-rest-api` | Client endpoint to  running validator, submit batches, and query the state of the ledger.
`sawtooth-poet-validator-registry-tp` | Provides a way to add new validators to a network running the PoET consensus algorithm.
`sawtooth-intkey-tp-python` | Allows users to set, increment, and decrement the value of entries stored in a state dictionary.
`sawtooth-xo-tp-python` | Allows users to play a simple board game known variously as tic-tac-toe, noughts and crosses, and XO.

The goal is to check the available hardware and estimate the resource comsumption of Hyperledger Sawtooth components.