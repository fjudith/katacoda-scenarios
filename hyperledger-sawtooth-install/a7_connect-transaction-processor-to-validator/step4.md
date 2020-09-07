# Step 4 - Configure the XO transaction processor

The host will be configured without opening an interactive terminal session to accelerate the host configuration

* Run the following commands to configure and start the `sawtooth-xo-tp-python` service.

```bash
docker exec -u sysops -it chsa-a7-02 << EOF
echo connect = "tcp://chsa-a7-00:4004" | sudo -u sawtooth tee -a /etc/sawtooth/xo.toml
sudo systemctl enable sawtooth-xo-tp-python
sudo systemctl start sawtooth-xo-tp-python
sudo journalctl -u sawtooth-xo-tp-python
EOF
```{{execute}}

* Exit the terminal session as `chsa-a4-01` peer list also need an update.

```bash
exit
```{{execute}}