# Step 1 - Demistifying network ID / System / Peer ID

From a block percepective:

1. Each block has a **transaction signer**.
2. The transaction signer has a **SIGNER ID** in the blockchain.
3. This SIGNER ID is nothing but the **public key of a given validator**.

* Open an interactive shell session in `chsa-c1-00`.

```bash
docker exec -it -u sysops chsa-c1-00 bash
```{{execute}}

* Filter the signers from the block list.

```bash
sawtooth block list | awk '{print $5}' | sort -ur
```{{execute}}

```bash
SIGNER
03c608c4e5677f0267be16b9928655dfe0a3426cb8913bd9d51091a5c9a762d8dc
03a4e389e6f37068a35f8740f38e740393c30474644d28a0479a5da4b771858d51
02b13ea2968a73d904539cc43587b5d79a7f17911b962f11bf59e23fc46a899848
```

* Confirm that the current node public key appears in the list (i.e. `chsa-c1-00`).

```bash
sawtooth block list | awk '{print $5}' | sort -ur | grep $(sudo cat /etc/sawtooth/keys/validator.pub)
```{{execute}}

```bash
02b13ea2968a73d904539cc43587b5d79a7f17911b962f11bf59e23fc46a899848
```
