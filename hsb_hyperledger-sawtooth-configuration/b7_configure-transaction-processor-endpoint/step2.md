# Step 2 - Validate

# IntKey transaction processor

* Create a transaction

```bash
intkey set LIGHTINGFAST 300000 
```{{ execute }}

* Validate the transaction

```bash
intkey list
```{{ execute }}

```bash
LIGHTINGFAST: 300000 
```

# XO transaction processor

* Create a game

```bash
xo create GAME0 
```{{ execute }}

* Create a transaction

```bash
xo take GAME0 7
```{{ execute }}

* Check the transation

```bash
xo show GAME0
```

```bash

```
