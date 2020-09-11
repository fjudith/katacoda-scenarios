# Step 1 - Configure default logging

The logging configuration is stored in `log_config.toml` file base on the build-in Python logging module.
Due to TOML limitation, it is required to use the YAML format to configure Remote Syslog.

* Open an interactive terminal session on the genesis node.

```bash
docker exec -u sysops -it chsa-b2-00 bash
```{{ execute }}

* Create the default log configuration file.

```bash
sudo touch /etc/sawtooth/log_config.yaml
```{{ execute }}

* Edit the file

```bash
sudo vim /etc/sawtooth/log_config.yaml
```{{ execute }}

* Switch to insert mode by typing `i`{{execute no-newline}}, then change the values as described below.

> **Notice**: All logs are sent to the local Rsyslog, only interconnect logs are pushed to the remotely to Graylog

```yaml
version: 1
disable_existing_loggers: false

formatters:
  simple:
    format: "[%(asctime)s.%(msecs)03d [%(threadName)s] %(module)s %(levelname)s] %(message)s"
    datefmt: "%H:%M:%S"
  
handlers:
  debug:
    level: "DEBUG"
    formatter: "simple"
    class: "logging.handlers.SysLogHandler"
    address: ["localhost", "514"]
    facility: "LOG_USER"
    socktype: "ext://socket.SOCK_DGRAM"
  error:
    level: "ERROR"
    formatter: "simple"
    class: "logging.handlers.SysLogHandler"
    address: ["localhost", "514"]
    facility: "LOG_USER"
    socktype: "ext://socket.SOCK_DGRAM"
  graylog:
    level: "DEBUG"
    formatter: "simple"
    class: "logging.handlers.SysLogHandler"
    address: ["graylog", "514"]
    facility: "LOG_USER"
    socktype: "ext://socket.SOCK_DGRAM"

loggers:
  sawtooth_validator.networking.interconnect:
    level: "DEBUG"
    propagate: false
    handlers: [ "graylog"]

root:
  level: "DEBUG"
  handlers:
    - "error"
    - "debug"
    - "graylog"
```{{ copy }}

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}

* Restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{ execute }}