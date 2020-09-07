# Step 5 - Test transaction

Both IntKey and XO transaction processor come with a CLI to interact with their respective transaction processor.

* Test the IntKey transaction processor.

```bash
docker exec -u sysops -it chsa-a7-00 bash -c 'intkey set test 10'
```{{execute}}

* Check the transaction processing.

```bash
docker exec -u sysops -it chsa-a7-00 bash -c 'intkey list'
```{{execute}}

```
test: 10
```

* test the XO transaction processor.

```bash
docker exec -u sysops -it chsa-a7-00 bash -c 'xo create test && xo take test 5 && xo list && xo show test'
```{{execute}}

```
GAME            PLAYER 1        PLAYER 2        BOARD     STATE
test            0269a5                          ----X---- P2-NEXT
GAME:     : test
PLAYER 1  : 0269a5
PLAYER 2  :
STATE     : P2-NEXT

    |   |
 ---|---|---
    | X |
 ---|---|---
    |   |
```
