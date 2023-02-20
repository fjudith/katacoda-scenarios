# Step 2 - Check services logs

Run the following command to check the successful services startup.

```bash
sudo journalctl \
-u sawtooth-validator \
-u sawtooth-settings-tp \
-u sawtooth-rest-api 
```{{execute}}

> Notice: Sawtooth Validator **failed** to start because validator keys and genesis bloc were not generated in the scenario.

```
-- Logs begin at Thu 2020-09-03 21:52:38 UTC, end at Thu 2020-09-03 21:53:10 UTC. --
Sep 03 21:52:58 chsa-a2-00 systemd[1]: Started Sawtooth Validator Server.
Sep 03 21:52:58 chsa-a2-00 systemd[1]: Started Sawtooth TP Settings.
Sep 03 21:52:58 chsa-a2-00 systemd[1]: Started Sawtooth REST API.
Sep 03 21:52:59 chsa-a2-00 sawtooth-validator[62]: [2020-09-03 21:52:59.118 ERROR    cli] No such signing key file: /etc/sawtooth/keys/validator.priv
Sep 03 21:52:59 chsa-a2-00 sawtooth-validator[62]: [2020-09-03 21:52:59.119 ERROR    cli] Initialization errors occurred (see previous log ERROR messages), shutting down.
Sep 03 21:52:59 chsa-a2-00 systemd[1]: sawtooth-validator.service: Main process exited, code=exited, status=1/FAILURE
Sep 03 21:52:59 chsa-a2-00 systemd[1]: sawtooth-validator.service: Unit entered failed state.
Sep 03 21:52:59 chsa-a2-00 systemd[1]: sawtooth-validator.service: Failed with result 'exit-code'.
```
