# Step 5 - Validate from load generator logs

The load generator should now display successful submission to all servers.

* Configure the second node.

> **Notice**: `1i` tells sed to insert the text that follows at line 1 of the file; don't the `\` newline at the end so that the existing line 1 is moved to line 2

```bash
docker exec -u sysops -it chsa-c2-01 bash -c "
sudo sed -ie '1iPERMIT_KEY 020aeb8bfa270f90c01961df6f25f084c61b1854bcc3285d8594380920ab841b44\' /etc/sawtooth/policy/policy.example && \
sudo cat /etc/sawtooth/policy/policy.example && \
sudo systemctl restart sawtooth-validator
"
```{{execute}}

* Configure the third node.

```bash
sudo sed -ie '1iPERMIT_KEY 020aeb8bfa270f90c01961df6f25f084c61b1854bcc3285d8594380920ab841b44\' /etc/sawtooth/policy/policy.example && \
sudo cat /etc/sawtooth/policy/policy.example && \
sudo systemctl restart sawtooth-validator
```{{execute}}