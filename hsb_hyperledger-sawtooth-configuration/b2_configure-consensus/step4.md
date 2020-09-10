# Step 4 - Validate

The PoET settings are handled by the `settings-tp`.

* Check the peering.

```bash
docker exec -u sysops -it chsa-b2-00 bash -c 'sawtooth peer list'
```{{ execute }}

* Check the settings.

```bash
docker exec -u sysops -it chsa-b2-00 bash -c 'sawtooth settings list'
```{{ execute }}
