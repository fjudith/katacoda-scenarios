# Step 4 - Create the Path configuration file

The default path configuration can be using the `path.toml` configuration file. 

1. Copy the configuration example file.

```bash
sudo -u sawtooth cp /etc/sawtooth/path.toml.example /etc/sawtooth/path.toml
```{{execute}}

2. Edit the Path configuration file.

```bash
sudo -u sawtooth vim /etc/sawtooth/path.toml
```{{execute}}

3. Add the following content to Path configuration file.

```toml
...
key_dir  = "/home/sawtooth/keys"
data_dir = "/home/sawtooth/data"
log_dir  = "/home/sawtooth/logs"
policy_dir = "/home/sawtooth/policy"
...
```
