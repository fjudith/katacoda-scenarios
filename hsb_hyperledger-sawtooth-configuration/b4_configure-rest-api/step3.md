# Step 3 - Validate

By default CLIs are trying to the local REST API endpoint (i.e. `http://localhost:8008`).
It then required to add the `--url` argument to connect to a remote REST API host.

* Open an interactive terminal session on the genesis node.

```bash
docker exec -u sysops -it chsa-b4-00 bash
```{{ execute }}

## Settings transaction processor

* Check the on-chain settings.

```bash
sawtooth settings list --url http://chsa-b4-02:8008
```{{ execute }}

## IntKey transaction processor

* Test the InKey transaction processor.

```bash
intkey set test 101 --url http://chsa-b4-02:8008
```{{ execute }}

```bash
intkey show test --url http://chsa-b4-02:8008
```{{ execute }}

## XO transaction processor

* Test the XO transaction processor.

```bash
xo create test --url http://chsa-b4-02:8008
```{{ execute }}

```bash
xo take test 5 --url http://chsa-b4-02:8008
```{{ execute }}

```bash
xo show test --url http://chsa-b4-02:8008
```{{ execute }}