# Step 3 - Configure the Intkey transaction processor

The IntKey process does not leverage a configuration file like other services. It instead use an environmnet file located int the `/etc/default` directory.
This file contains all the command line arguments to run the `intey-tp` process.

* Open an interactive shell session in `chsa-a7-01`.

```bash
docker exec -it -u sysops chsa-a7-01 bash
```{{execute}}

* Edit the Intkey TP environment file

```bash
sudo vim /etc/default/sawtooth-intkey-tp-python
```{{execute}}

* Switch to insert mode by typing `i`{{execute no-newline}}, , then change the arguments as described below.

```bash
...
SAWTOOTH_INTKEY_TP_PYTHON_ARGS=-v -C tcp://chsa-a7-00:4004
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To exit, type `:q!`{{execute}}

* Enable the service automatic startup

```bash
sudo systemctl enable sawtooth-intkey-tp-python
```{{execute}}

* Start the service

```bash
sudo systemctl start sawtooth-intkey-tp-python
```{{execute}}

* Check the service registration

```bash
sudo journalctl -u sawtooth-intkey-tp-python
```{{execute}}

```
tbc
```

* Exit the terminal session as `chsa-a4-01` peer list also need an update.

```bash
exit
```{{execute}}
