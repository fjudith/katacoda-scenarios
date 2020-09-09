# Step 1 - Create target directories

Run the following commands to create the various configuration and data directories with the appropriate permissions.

1. Create the folders in `sawtooth` home directory.

```bash
sudo -u sawtooth mkdir -p \
/home/sawtooth/keys \
/home/sawtooth/data \
/home/sawtooth/logs \
/home/sawtooth/policy
```{{ execute }}

> `sudo -u sawtooth` is used to avoid the use of the `chown sawtooth:sawtooth -R`

2. Check that that directories are porperly owned by the `sawtooth` user and group

```bash
sudo ls -l /home/sawtooth/
```{{ execute }}
