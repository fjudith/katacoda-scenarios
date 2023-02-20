# Step 2 - Validate

As shown below, the `cli.toml` custimization only affects the `sawtooth` CLI.
The `intkey` and `xo` command still require the `--url` to connect to a remote REST API.

## Sawtooth CLI

* Check the state.

```bash
sawtooth state list
```{{ execute }}

```bash
sawtooth block list
```{{ execute }}

```bash
sawtooth transaction list
```{{ execute }}

> **Notice**: The `sawtooth settings list` does not work in v1.0.5.

```bash
sawtooth settings list
```{{ execute }}

```bash
Error: Unable to connect to "http://localhost:8008": make sure URL is correct
```

# IntKey CLI

* Test to add an entry.

```bash
intkey set test 100
```{{ execute }}

```bash
Error: Failed to connect to REST API: HTTPConnectionPool(host='127.0.0.1', port=8008): Max retries exceeded with url: /batches
```

# XO CLI

* Test to create a game.

```bash
xo create test
```{{ execute }}

```bash
Error: Failed to connect to http://127.0.0.1:8008/batches: HTTPConnectionPool(host='127.0.0.1', port=8008): Max retries exceeded with url: /batches
```