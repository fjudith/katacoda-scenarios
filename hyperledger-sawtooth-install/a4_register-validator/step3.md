
# Step 3 - Enable, start and check services startup

Only **Validator** and **Settings** transactation processor are required.

* Enable services.

```bash
sudo systemctl enable \
sawtooth-validator \
sawtooth-settings-tp
```{{execute}}

* Start base services.

```bash
sudo systemctl start \
sawtooth-validator \
sawtooth-settings-tp
```{{execute}}

* Check services logs.

```bash
sudo journalctl \
-u sawtooth-validator \
-u sawtooth-settings-tp
```{{execute}}

```text
-- Logs begin at Fri 2020-09-04 00:13:17 UTC, end at Fri 2020-09-04 00:22:22 UTC. --
Sep 04 12:21:47 chsa-a4-02 systemd[1]: Started Sawtooth Validator Server.
Sep 04 12:21:47 chsa-a4-02 systemd[1]: Started Sawtooth TP Settings.
Sep 04 12:21:47 chsa-a4-02 systemd[1]: Started Sawtooth Validator Server.
Sep 04 12:21:47 chsa-a4-02 settings-tp[76]: [2020-09-04 00:21:47.695 INFO     core] register attempt: OK
Sep 04 12:21:51 chsa-a4-02 systemd[1]: Started Sawtooth Validator Server.
Sep 04 12:21:51 chsa-a4-02 systemd[1]: Started Sawtooth TP Settings.
```

* Exit the terminal session.

```bash
exit
```
