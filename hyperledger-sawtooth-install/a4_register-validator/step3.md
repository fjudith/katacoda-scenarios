
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
-- Logs begin at Fri 2020-09-04 16:35:46 UTC, end at Fri 2020-09-04 16:38:08 UTC. --
Sep 04 16:37:45 chsa-a4-02 systemd[1]: Started Sawtooth Validator Server.
Sep 04 16:37:45 chsa-a4-02 systemd[1]: Started Sawtooth TP Settings.
Sep 04 16:37:46 chsa-a4-02 settings-tp[74]: [2020-09-04 16:37:46.230 INFO     core] register attempt: OK
Sep 04 16:37:46 chsa-a4-02 settings-tp[74]: [2020-09-04 16:37:46.257 INFO     handler] Setting setting sawtooth.settings.vote.authorized_keys changed from None to 023d14aca5c38ecc46e55d0e6e2ece9d7160ed2de1715121853ecd8fbee60e288c
```

* Exit the terminal session.

```bash
exit
```{{execute}}
