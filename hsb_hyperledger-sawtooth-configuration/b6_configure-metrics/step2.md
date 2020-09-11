# Step 2 - Configure REST API metrics

Specification     | Value
----------------- | -----
**TDSB URL**      | `http://chsa-b6-influxdb:8086`{{ copy }}
**TSDB database** | `metrics`{{ copy }}
**TSDB username** | `lrdata`{{ copy }}
**TSDB password** | `{lrdata-pw}`{{ copy }}

* Edit the REST API configuration file.

```bash
sudo vim /etc/sawtooth/rest_api.toml
```{{ execute }}

* Switch to insert mode by typing `i`{{ execute no-newline }}, then change the values as described below.

```toml
# The host and port for Open TSDB database used for metrics
opentsdb_url = "http://chsa-b6-01:8086"

# The name of the database used for storing metrics
opentsdb_db = "metrics"

opentsdb_username = "lrdata"
opentsdb_password = "{lrdata-pw}"
```{{ copy }}

* Once finished, press ESC (`^ESC`{{ execute ctrl-seq }}) to switch back to normal mode
* To save and exit, type `:wq`{{ execute }}

* Restart the REST API service.

```bash
sudo systemctl restart sawtooth-rest-api
```{{execute}}