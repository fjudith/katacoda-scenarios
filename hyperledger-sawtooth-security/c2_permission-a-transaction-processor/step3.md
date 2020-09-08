# Step 3 - Retreive the load generator user public key

The `loadgen` user public key needs to be retreived in order add it to permitted keys in the policy file of **each** Validator nodes.

* Open an interactive shell session in `chsa-c2-loadgen`.

```bash
docker exec -it -u loadgen chsa-c2-loadgen bash
```{{execute}}

* Copy the public key

```bash
cat ~/.sawtooth/keys/loadgen.pub
```

```bash
020aeb8bfa270f90c01961df6f25f084c61b1854bcc3285d8594380920ab841b44
```

* Exit the terminal session.

```bash
exit
```{{execute}}
