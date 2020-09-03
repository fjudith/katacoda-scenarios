# Step 1 - Add the Hyperledger Sawtooth package repository

Run the following commands to add the Hyperledger sawtooth package repository.

1. Configure the repository key.

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AA7AF1F1091A5FD
```{{ execute }}

2. Add the repository.

```bash
sudo add-apt-repository 'deb http://repo.sawtooth.me/ubuntu/1.0/stable xenial universe'
```{{execute}}

3. Update the repository list.

```bash
sudo apt get update
```{{execute}}
