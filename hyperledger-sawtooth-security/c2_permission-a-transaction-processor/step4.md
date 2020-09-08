# Step 4 - Add the key to the genesis node policy file

* Open an interactive shell session in `chsa-c2-00`.

```bash
docker exec -u sysops -it chsa-c2-00 bash
```{{execute}}

* Edit the policy file.

```bash
sudo vim /etc/sawtooth/keys/policy.example
```{{execute}}

* Switch to insert mode by typing `i`{{execute no-newline}}, then add the instruction **at the top** of the file as shown below.

```toml
PERMIT_KEY 020aeb8bfa270f90c01961df6f25f084c61b1854bcc3285d8594380920ab841b44
...
DENY_KEY *
```

* Once finished, press ESC (`^ESC`{{execute ctrl-seq}}) to switch back to normal mode
* To save and exit, type `:wq`{{execute}}

* Restart the Validator service.

```bash
sudo systemctl restart sawtooth-validator
```{{ execute }}

* Exit the terminal session.

```bash
exit
```{{execute}}

