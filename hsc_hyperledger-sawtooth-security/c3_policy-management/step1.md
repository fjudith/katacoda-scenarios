# Step 1 - Install the Identity transaction processor

On-Chain configuration is enabled by running the `sawtooth-identity-tp` service which is not installed by the `sawtooth` package.
The `python3-sawtooth-identity` package have to be installed on all nodes participating in the Sawtooth network to support the `sawtooth_identity` transaction family and accept the use of the `sawtooth identy` commands.

* Open an interactive shell session in `chsa-c3-00`.

```bash
docker exec -it -u sysops chsa-c3-00 bash
```{{execute}}

* Install the Sawtooth identity package.

```bash
sudo apt-get update -y && sudo apt-get install -y python3-sawtooth-identity
```{{execute}}

* Enable and start the Sawtooth Identity transaction processor service.

```bash
sudo systemctl enable sawtooth-identity-tp && \
sudo systemctl start sawtooth-identity-tp
```{{execute}}

* Check the `sawtooth_identity` transaction family registration from the validator logs.

```bash
sudo grep "registered transaction processor" /var/log/sawtooth/validator-debug.log
```{{execute }}

```bash
...
[14:52:30.397 [Thread-4] processor_handlers INFO] registered transaction processor: connection_id=5446fa9af5088c45b9ec4b74468554d44bcf05400dc5867bb4f5bb2912da4e31d5ed7e1f55a4feef3a721b7048fc4cd055b8510c55a6490ab17c852dc923be54, family=sawtooth_identity, version=1.0, namespaces=['00001d']
```

* Exit the terminal session.

```bash
exit
```{{execute}}

* Configure the two other nodes remotely.

```bash
docker exec -u sysops -it chsa-c3-01 bash -c "
sudo apt-get update -y && sudo apt-get install -y python3-sawtooth-identity &&\
sudo systemctl enable sawtooth-identity-tp && \
sudo systemctl start sawtooth-identity-tp
"
```{{execute}}

```bash
docker exec -u sysops -it chsa-c3-02 bash -c "
sudo apt-get update -y && sudo apt-get install -y python3-sawtooth-identity &&\
sudo systemctl enable sawtooth-identity-tp && \
sudo systemctl start sawtooth-identity-tp
"
```{{execute}}
