# Step 3 - Configure on-chain permissions

* Re-open an interactive shell session in `chsa-c3-00`.

```bash
docker exec -u sysops -it chsa-c3-00 bash
```{{execute}}

* Enable `sysops` user to submit Identity transactions

```bash
sudo sawset proposal create \
-k /etc/sawtooth/keys/validator.priv \
sawtooth.identity.allowed_keys=$(cat ~/.sawtooth/keys/sysops.pub)
```{{execute}}

* Create a policy which **allow** the current `sysops` user, **deny** `loadgen` public keys. While denying any other keys.

```bash
sawtooth identity policy create "mypolicy" \
"PERMIT_KEY $(cat ~/.sawtooth/keys/sysops.pub)" \
"DENY_KEY 020aeb8bfa270f90c01961df6f25f084c61b1854bcc3285d8594380920ab841b44" \
"DENY_KEY *"
```{{execute}}

* Create a Transactor role associated to the policy.

```bash
sawtooth identity role create transactor "mypolicy"
```{{execute}}

* Check the policy registration.

```bash
sawtooth identity policy list
```{{execute}}

* Check the role registration.

```bash
sawtooth identity role list
```{{execute}}