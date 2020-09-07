# Check the peering

To investigate efficiently, it is recommended to send commands instead of opening terminal sessions.

* Open an interactive shell session in `chsa-a6-00`.

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sawtooth peer list'
```{{execute}}

> **Notice**: The list of peers seems correct.

```
tcp://chsa-a6-02:8800,tcp://chsa-a6-01:8800
```