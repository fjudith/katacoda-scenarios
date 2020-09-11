# Step 4 - Validate

The PoET settings are handled by the `settings-tp`.

* Check the peering.

```bash
docker exec -u sysops -it chsa-b2-00 bash -c 'sawtooth peer list'
```{{ execute }}

```bash
tcp://chsa-b2-01:8800,tcp://chsa-b2-02:8800
```

* Check the settings.

```bash
docker exec -u sysops -it chsa-b2-00 bash -c 'sawtooth settings list'
```{{ execute }}

```bash
sawtooth.consensus.algorithm: poet
sawtooth.poet.report_public_key_pem: -----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArMvzZi8GT+lI9KeZiInn
4CvFTiuyid+IN4...
sawtooth.poet.valid_enclave_basenames: ...
sawtooth.poet.valid_enclave_measurements: ...
sawtooth.settings.vote.authorized_keys: ...
```
