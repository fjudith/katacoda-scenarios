# Step 4 - Check validator peering

The third node needs to be configured in same way as the `chsa-a5-01`. Expect the `endpoint` that need to be changed.

* Open an interactive shell session in `chsa-a4-00`.

```bash
docker exec -it -u sysops chsa-a4-00 bash
```{{execute}}

* Check the list of Peer using the `sawtooth` CLI.

```bash
sawtooth peer list
```{{execute}}

> **Notice**: Only the `chsa-a4-01` appears twice.

```text
tcp://chsa-a4-01:8800,tcp://chsa-a4-01:8800,tcp://chsa-a4-02:8800
```