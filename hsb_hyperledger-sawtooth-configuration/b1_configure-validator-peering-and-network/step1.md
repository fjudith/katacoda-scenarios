# Step 1 - Check the genesis node configuration

To ensure that **dynamic** peering works, it required to check that the genesis node is properly configured as follow.

1. The `network` component is binded an exposed NIC or IP address.
2. The `endpoint` is configured with the Hostname or non-local IP address.
3. The `peering` is set to `dynamic` instead of the default `static`.
4. The `seeds` list contains at least one network node IP address.

* Open an interactive terminal session on the genesis node.

```bash
docker exec -u sysops -it chsa-b1-00 bash
```{{ execute }}

* Check the current validator configuration

```bash
sudo grep -E "network:.*|endpoint\s=|peering\s=|seeds\s=" /etc/sawtooth/validator.toml
```

> **Notice**: The `seeds` list is disabled **only** on the genesis node as no other node is currently capable to share the topology.

```toml
  "network:tcp://eth0:8800",
peering = "dynamic"
endpoint = "tcp://chsa-b1-00:8800"
# seeds = ["tcp://127.0.0.1:8801"]
```

* Exit the terminal session.

```bash
exit
```{{ execute }}