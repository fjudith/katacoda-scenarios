# Persist RAID configuration and mount points

So far the created arrays will be lost on reboot.
The setup needs to be saved in the '/etc/mdadm/mdadm.conf' configuration file.

Declare the managed HDD drives.

```bash
echo 'DEVICE /dev/sd[a-l]' | tee mdadm.conf
```

Declare the running RAID arrays.

```bash
mdadm --detail --scan | tee -a mdadm.conf
```

Persist the configuration.

```bash
cat mdadm.conf | sudo tee -a /etc/mdadm/mdadm.conf
``` 

Persist the mount configuration.

```bash
cat <<EOF | sudo tee -a /etc/fstab
/dev/md0p1  /mnt/raid0  ext4  default  0 1
/dev/md1p1  /mnt/raid1  ext4  default  0 1
/dev/md2p1  /mnt/raid5  ext4  default  0 1
/dev/md3p1  /mnt/raid6  ext4  default  0 1
EOF
```
