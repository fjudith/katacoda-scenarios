# Step 4 - Check validator peering

The third node needs to be configured in same way as the `chsa-a5-01`. Expect the `endpoint` that need to be changed.

* Open an interactive shell session in `chsa-a5-00`.

```bash
docker exec -it -u sysops chsa-a5-00 bash
```{{execute}}

* Check the list of Peer using the `sawtooth` CLI.

```bash
sawtooth peer list
```{{execute}}

> **Notice**: Only the `chsa-a5-01` appears twice.

```
tcp://chsa-a5-01:8800,//chsa-a5-02:8800
```
