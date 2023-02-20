# Step 1 - Create target directories

By default Hyperledger Sawtooth use the following directories.

* `/etc/sawtooth/`: Configuration files
* `/etc/default/`: Systemd service environment files
* `/etc/sawtooth/policy`: Off-chain policy files
* `/etc/sawtooth/keys`: Validator key-pair (i.e. `sawadm keygen`)
* `/var/lib/sawtooth`: Genesis block and Data directory (i.e. `sawadm genesis`)
* `/var/log/sawtooth`: Log files

* Open an interactive shell session in `chsa-b10-00`.

```bash
docker exec -it -u sysops chsa-b10-00 bash
```{{execute}}

* Create the folders in `sawtooth` home directory.

```bash
sudo -u sawtooth mkdir -p \
/home/sawtooth/keys \
/home/sawtooth/data \
/home/sawtooth/logs \
/home/sawtooth/policy
```{{ execute }}

> `sudo -u sawtooth` is used to avoid the use of the `chown sawtooth:sawtooth -R`

* Check that that directories are porperly owned by the `sawtooth` user and group.

```bash
sudo ls -l /home/sawtooth/
```{{ execute }}
