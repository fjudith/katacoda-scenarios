# Step 2 - Check if genesis block has been loaded

The loading of the Genesis batch can be tracked from the Validator debug logs.

* Check that `sawtooth.settings.vote.authorized_keys:` setting is available on-chain.

```bash
sawtooth settings list
```{{execute}}

```
sawtooth.settings.vote.authorized_keys: ...
```

* The genesis block loading sequence can be observed from the Validator debug log as well.

```bash
sudo cat /var/log/sawtooth/validator-debug.log | grep genesis
```{{execute}}

```
18:54:08.345 [MainThread] genesis DEBUG] genesis_batch_file: /var/lib/sawtooth/genesis.batch
[18:54:08.345 [MainThread] genesis DEBUG] block_chain_id: not yet specified
[18:54:08.346 [MainThread] genesis INFO] Producing genesis block from /var/lib/sawtooth/genesis.batch
[18:54:08.346 [MainThread] genesis DEBUG] Adding 1 batches
[18:54:08.378 [MainThread] genesis DEBUG] Produced state hash 7459706a86a228549f5165ace06361b7c96539d534de97f020f0a702dc2b88a5 for genesis block.
[18:54:08.383 [MainThread] genesis INFO] Genesis block created: f0edfd71297ea388cc33f488c99f7bfab5f7ee015aaaf02af7cebf94e68429843cfddb65e67997342fbfc320e69fe7259fed07a555c6c84d151e9db79c73c342 (block_num:0, state:7459706a86a228549f5165ace06361b7c96539d534de97f020f0a702dc2b88a5, previous_block_id:0000000000000000)
[18:54:08.384 [MainThread] genesis DEBUG] Deleting genesis data.
```
