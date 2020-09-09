# Step 2 - Check the content of the policy file

A policy file contains only `PERMIT_KEY` and `DENY_KEY` instructions associated to a public key.
Those entries are processed sequentially from the top to the down.

* Display the policy file content.

```bash
sudo tail /etc/sawtooth/policy/policy.example
```{{execute}}

> **Notice**: As usual, the last instruction ; `DENY *`; consists to reject any key that is not already permitted previously.

```bash
PERMIT_KEY 02224f6a0f739d6fae27bab08f214132560acbd1c908caeeeafd09b455280ca20d
DENY_KEY *
```

* The permitted key correspond to public key of the sysops user.

```bash
grep "$(cat ~/.sawtooth/keys/sysops.pub)" /etc/sawtooth/policy/policy.example
```{{execute}}

```bash
PERMIT_KEY 02224f6a0f739d6fae27bab08f214132560acbd1c908caeeeafd09b455280ca20d
```

* Exit the terminal session.

```bash
exit
```{{execute}}
