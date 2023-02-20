# Create a RAID-1 device

RAID-1 allows multiple disk to mirror the data to a secondary standby disk.
In case of a failure the primary disk is disable and the secondary activated.

I/O performance remains equivalent to a single hard disk drive (HDD)

Run the following command to list available ISCSI HDD.

```bash
lsblk --iscsi
```

Run the following command to create a RAID-1 device composed of the following 2 HDDs.

* `/dev/sdd1`
* `/dev/sde1`

```bash
mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sd[de]1
```
