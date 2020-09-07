# Step 1 - Check hardware capacity and process consumtion

* Open an interactive shell session in `chsa-a9-00`.

```bash
docker exec -it -u sysops chsa-a9-00 bash
```{{execute}}

* Check the number of CPU.

```bash
grep 'cpu cores' /proc/cpuinfo | uniq
```{{execute}}

```bash
cpu cores       : 1
```

* Check the amount of Memory.

```bash
grep 'MemTotal' /proc/meminfo
```{{execute}}

```bash
MemTotal:        1541956 kB
```

* Restart the Validator service

```bash
sudo systemctl restart sawtooth-validator
```
