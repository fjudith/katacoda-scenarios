# Step 1 - Configure Vaidator metrics

Sawtooth support OpenTSDB protocol over HTTP only, which support basic authentication.

Specification     | Value
----------------- | -----
**TDSB URL**      | `http://chsa-b6-influxdb:8086`{{ copy }}
**TSDB database** | `metrics`{{ copy }}
**TSDB username** | `lrdata`{{ copy }}
**TSDB password** | `{lrdata-pw}`{{ copy }}

* Open an interactive shell session in `chsa-b6-00`.

```bash
docker exec -it -u sysops chsa-b6-00 bash
```{{ execute }}

* Edit the Validator configuration file.

```bash
sudo vim /etc/sawtooth/validator.toml
```{{ execute }}

* Switch to insert mode by typing `i`{{ execute no-newline }}, then change the values as described below.

```toml
# The host and port for Open TSDB database used for metrics
opentsdb_url = "http://chsa-b6-influxdb:8086"

# The name of the database used for storing metrics
opentsdb_db = "metrics"

opentsdb_username = "lrdata"

opentsdb_password = "{lrdata-pw}"
```{{ copy }}

* Once finished, press ESC (`^ESC`{{ execute ctrl-seq }}) to switch back to normal mode
* To save and exit, type `:wq`{{ execute }}

* Restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{execute}}