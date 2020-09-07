# Step 1 - Check hardware capacity and process consumtion

* Open an interactive shell session in `chsa-a9-00`.

```bash
docker exec -it -u sysops chsa-a9-00 bash
```{{execute}}

* Check the number of CPU.

```bash
grep 'cpu cores' /proc/cpuinfo
```{{execute}}

```bash
cpu cores       : 1
cpu cores       : 1
```

* Check the amount of Memory.

```bash
grep 'MemTotal' /proc/meminfo
```{{execute}}

```bash
MemTotal:        1541956 kB
```

* Check Sawtooth process consumtion.

```bash
htop
```

> **Notice**: As the network is processing transactions, the CPUs are under 1% load and RAM consumtion is under 500MB.

