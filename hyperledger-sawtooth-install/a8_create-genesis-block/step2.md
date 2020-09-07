# Step 2 - Check if genesis block has been loaded

The loading of the Genesis batch can be tracked from the Validator debug logs.

* Check the Validator logs for generis batch entries.

```bash
sudo cat /var/log/sawtooth/validator-debug.log | grep genesis
```{{execute}}

* Check that `sawtooth.settings.vote.authorized_keys:` setting is available on-chain.

```bash
sawtooth setting list
```{{execute}}

```
sawtooth.settings.vote.authorized_keys: ...
```
