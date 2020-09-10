# Step 3 - Configure the third node and validate the peering

The third node will be configured remotely to demonstrate how to operate at scale.

* Run the following command to configured the last node.

```bash
docker exec -u sysops -it chsa-b1-02 bash -c '
sudo sed -i "s#\(network:tcp://\).*\(:8800\)#\1eth0\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(endpoint\s\=\s\"tcp://\).*\(:8800\"\)#\1$(hostname)\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(peering\s\=\s\"\).*\(\"\)#\1dynamic\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(seeds\s\=\s\[\"\).*\(\"\]\)#\1tcp://chsa-b1-00:8800\2#g" /etc/sawtooth/validator.toml && \
sudo systemctl enable sawtooth-validator sawtooth-settings-tp sawtooth-xo-tp-python sawtooth-rest-api && \
sudo systemctl start sawtooth-validator sawtooth-settings-tp sawtooth-xo-tp-python sawtooth-rest-api
'
```{{ execute }}

> **Notice**: Wait 20-40 seconds, the time for the network to form the mesh.

* Check the peering status from each node.

```bash
sleep 20 && \
docker exec -u sysops -it chsa-b1-00 bash -c 'sawtooth peer list' && \
docker exec -u sysops -it chsa-b1-01 bash -c 'sawtooth peer list' && \
docker exec -u sysops -it chsa-b1-02 bash -c 'sawtooth peer list'
```{{ execute }}

```bash
tcp://chsa-b1-02:8800,tcp://chsa-b1-01:8800
tcp://chsa-b1-00:8800,tcp://chsa-b1-02:8800
tcp://chsa-b1-01:8800,tcp://chsa-b1-00:8800
```
