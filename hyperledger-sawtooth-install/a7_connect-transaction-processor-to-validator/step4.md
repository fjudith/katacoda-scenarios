# Step 4 - Configure the XO transaction processor

The host will be configured without opening an interactive terminal session to accelerate the host configuration

* Run the following commands to configure and start the `sawtooth-xo-tp-python` service.

```bash
docker exec -u sysops chsa-a7-02 bash -c '
sudo sed -i "s/localhost/chsa-a7-00/g" /etc/default/sawtooth-xo-tp-python
sudo systemctl enable sawtooth-xo-tp-python;
sudo systemctl start sawtooth-xo-tp-python;
sleep 5;
sudo journalctl -u sawtooth-xo-tp-python
'
```{{execute}}