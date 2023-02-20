# Step 2 - Validate

# IntKey transaction processor

* Create a transaction

```bash
docker exec -u sysops -it chsa-b7-00 bash -c \
'intkey set LIGHTINGFAST 300000'
```{{ execute }}

* Validate the transaction

```bash
docker exec -u sysops -it chsa-b7-00 bash -c \
'intkey list'
```{{ execute }}

```bash
LIGHTINGFAST: 300000 
```

# XO transaction processor

* Create a game

```bash
docker exec -u sysops -it chsa-b7-00 bash -c \
'xo create GAME0'
```{{ execute }}

* Create a transaction

```bash
docker exec -u sysops -it chsa-b7-00 bash -c \
'xo take GAME0 7'
```{{ execute }}

* Check the transation

```bash
docker exec -u sysops -it chsa-b7-00 bash -c  \
'xo show GAME0'
```{{ execute }}

```bash
GAME:     : GAME0
PLAYER 1  : 02de22
PLAYER 2  :
STATE     : P2-NEXT

    |   |
 ---|---|---
    |   |
 ---|---|---
  X |   |
```
