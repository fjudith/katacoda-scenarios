# Step 3 - Copy the configuration files and data

> Note: ervice configuration files located at the root of the `/etc/sawtooth` folder cannot be moved.

1. Migrate Validator keys

```bash
sudo -u sawtooth cp -va /etc/sawtooth/keys/. /home/sawtooth/keys/
```{{ execute }}

2. Migrate Sawtooth databases

```bash
sudo -u sawtooth cp -va /var/lib/sawtooth/. /home/sawtooth/data/
```{{ execute }}

3. Migrate Sawtooth log files

```bash
sudo -u sawtooth cp -va /var/log/sawtooth/. /home/sawtooth/logs/
```{{ execute }}

4. Migrate Sawtooth policy files

```bash
sudo -u sawtooth cp -va /etc/sawtooth/policy/. /home/sawtooth/policy/
```{{ execute }}