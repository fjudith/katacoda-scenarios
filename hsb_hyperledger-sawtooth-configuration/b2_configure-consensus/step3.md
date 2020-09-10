# Step 3 - Configure remaining nodes

The second and third nodes will be configured remotely to accelerate the operations.

* Run the following command to configure the second node.

```bash
docker exec -u sysops -it chsa-b2-01 bash -c '
sudo sawadm keygen && \
sudo sed -i "s#\(network:tcp://\).*\(:8800\)#\1eth0\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(endpoint\s\=\s\"tcp://\).*\(:8800\"\)#\1$(hostname)\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(peering\s\=\s\"\).*\(\"\)#\1dynamic\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(seeds\s\=\s\[\"\).*\(\"\]\)#\1tcp://chsa-b2-00:8800\2#g" /etc/sawtooth/validator.toml && \
SVC="sawtooth-validator \
sawtooth-settings-tp \
sawtooth-poet-validator-registry-tp \
sawtooth-rest-api \
sawtooth-intkey-tp-python" && \
sudo systemctl enable ${SVC} && \
sudo systemctl start ${SVC}
'
```{{ execute }}

* Run the following command to configure the last node.

```bash
docker exec -u sysops -it chsa-b2-02 bash -c '
sudo sawadm keygen && \
sudo sed -i "s#\(network:tcp://\).*\(:8800\)#\1eth0\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(endpoint\s\=\s\"tcp://\).*\(:8800\"\)#\1$(hostname)\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(peering\s\=\s\"\).*\(\"\)#\1dynamic\2#g" /etc/sawtooth/validator.toml && \
sudo sed -i "s#\(seeds\s\=\s\[\"\).*\(\"\]\)#\1tcp://chsa-b2-00:8800\2#g" /etc/sawtooth/validator.toml && \
SVC="sawtooth-validator \
sawtooth-settings-tp \
sawtooth-poet-validator-registry-tp \
sawtooth-rest-api \
sawtooth-intkey-tp-python" && \
sudo systemctl enable ${SVC} && \
sudo systemctl start ${SVC}
'
```{{ execute }}
