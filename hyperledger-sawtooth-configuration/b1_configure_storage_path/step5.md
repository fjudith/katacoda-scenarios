# Step 5 - Restart and test

1. Restart all services.

```bash
sudo systemctl restart \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api \
sawtooth-xo-tp-python \
sawtooth-intkey-tp-python
```{{execute}}

2. Validate that authorized key is the same as the previous configuration.

```bash
sawtooth settings list | grep $(cat ~/.sawtooth/keys/sysops.pub)
```{{execute}}