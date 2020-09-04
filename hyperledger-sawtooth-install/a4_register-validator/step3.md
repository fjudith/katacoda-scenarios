
# Step 3 - Enable, start and check services startup

Only **Validator** and **Settings** transactation processor are required.

* Enable services.

```bash
sudo systemctl enable \
sawtooth-validator \
sawtooth-settings-tp \
```{{execute}}

* Start base services.

```bash
sudo systemctl start \
sawtooth-validator \
sawtooth-settings-tp \
```{{execute}}

* Check services logs.

```bash
sudo journalctl \
-u sawtooth-validator \
-u sawtooth-settings-tp \
```{{execute}}

> **Notice**: Sawtooth Validator raised an **insecure warning** because it started with the default configuration, which does not include `network_public_key` and `network_private_key` configuration parameters.

```text
-- Logs begin at Thu 2020-09-03 22:40:22 UTC, end at Thu 2020-09-03 22:43:39 UTC. --
Sep 03 22:43:19 chsa-a3-00 systemd[1]: Started Sawtooth Validator Server.
Sep 03 22:43:19 chsa-a3-00 systemd[1]: Started Sawtooth TP Settings.
Sep 03 22:43:19 chsa-a3-00 systemd[1]: Started Sawtooth REST API.
Sep 03 22:43:19 chsa-a3-00 sawtooth-validator[72]: [2020-09-03 22:43:19.632 WARNING  cli] Network key pair is not configured, Network communications between validators will not be authenticated or encrypted.
Sep 03 22:43:19 chsa-a3-00 settings-tp[73]: [2020-09-03 22:43:19.736 INFO     core] register attempt: OK
```
