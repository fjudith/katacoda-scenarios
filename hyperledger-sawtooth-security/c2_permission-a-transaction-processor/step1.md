# Step 1 - Discover enabled policy files

Off-Chain configuration is enabled via the `[permissions]` section of the Validator configuration files.
This section contains a set of key/value where:

1. **Key** tie to a [Transactor role](https://sawtooth.hyperledger.org/docs/core/releases/1.0.5/sysadmin_guide/configuring_permissions.html#transactor-roles) or [Network role](https://sawtooth.hyperledger.org/docs/core/releases/1.0.5/sysadmin_guide/configuring_permissions.html#network-roles) name.
2 **Value** correspond to a policy file stored in `/etc/sawtooth/policy` directory, by default.

* Open an interactive shell session in `chsa-c2-00`.

```bash
docker exec -it -u sysops chsa-c2-00 bash
```{{execute}}

* Check policies enabled in the Validator configuration file.

```bash
sudo tail /etc/sawtooth/validator.toml
```{{execute}}

> **Notice**: the `transactor` role is enabled and use the file name `policy.example`.

```toml
# network = "trust"

# Any off-chain transactor permission roles. The roles should match the roles
# stored in state for transactor permissioning. Due to the roles having . in the
# key, the key must be wrapped in quotes so toml can process it. The value
# should be the file name of a policy stored in the policy_dir.

[permissions]
transactor = "policy.example"
# "transactor.transaction_signer" = "policy.example"
```
