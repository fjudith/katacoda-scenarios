# Step 2 - Stop all Sawtooth services

Sawtooth Validatior and Transaction Processors must be stopped to ensure the database copy integrity.

```bash
sudo systemctl stop \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api \
sawtooth-xo-tp-python \
sawtooth-intkey-tp-python
```{{ execute }}