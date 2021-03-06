# Step 1 - Add the Hyperledger Sawtooth package repository

Run the following command to open an interactive shell session in the `chsa-a1-00` container.

```bash
docker exec -it -u sysops chsa-a1-00 bash
```{{execute}}

* Configure the repository key.

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AA7AF1F1091A5FD
```{{ execute }}

* Add the repository.

```bash
sudo add-apt-repository 'deb http://repo.sawtooth.me/ubuntu/1.0/stable xenial universe'
```{{execute}}

* Update the repository list.

```bash
sudo apt-get update
```{{execute}}
