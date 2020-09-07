# Step 5 - Test transaction

Both IntKey and XO transaction processor come with a CLI to interact with their respective transaction processor.

* Test the IntKey transaction processor.

```bash
docker exec -u sysops -it chsa-a7-00 bash -c 'intkey set test 10'
docker exec -u sysops -it chsa-a7-00 bash -c 'intkey list'
```{{execute}}

* test the XO transaction processor.

```bash
docker exec -u sysops -it chsa-a7-00 bash -c 'xo create test && xo take test 5 && xo list && xo show test'
```{{execute}}
