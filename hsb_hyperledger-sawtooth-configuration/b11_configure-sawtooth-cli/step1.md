# Step 1 - Configure the CLI

Sawtooth relies on the `cli.toml` configuration file to determine the REST API url to connect to.
If this file does not exists the cli will the default to the locally (i.e. `http://localhost:8008`).

* Open an interactive shell session in `chsa-b11-00`.

```bash
docker exec -it -u sysops chsa-b11-00 bash
```{{execute}}

* Copy the CLI configuration example.

```bash
sudo cp /etc/sawtooth/cli.toml.example /etc/sawtooth/cli.toml
```{{ execute }}

* Allocate the appropriate permissions.

```bash
sudo chown root:sawtooth /etc/sawtooth/cli.toml
```{{ execute }}

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/cli.toml
```{{ execute }}

* Switch to insert mode by typing `i`{{ execute no-newline }}, then change the values as described below.

```toml
url = "http://chsa-b11-00:8008"
```{{ copy }}

* Once finished, press ESC (`^ESC`{{ execute ctrl-seq }}) to switch back to normal mode
* To save and exit, type `:wq`{{ execute }}