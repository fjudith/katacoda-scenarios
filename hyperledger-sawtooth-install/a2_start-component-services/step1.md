# Step 1 - Enable and start base services

Run the following command to open an interactive shell session in the `chsa-a2-00` container.

```bash
docker exec -it -u sysops chsa-a2-00 bash
```{{execute}}

* Enable on-boot services startup.

```bash
sudo systemctl enable \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api
```{{ execute }}

* Add the repository.

```bash
sudo systemctl start \
sawtooth-validator \
sawtooth-settings-tp \
sawtooth-rest-api
```{{execute}}
