# Create a RAID-01 device

RAID-01 (a.k.a RAID-1) allow a given hard disk drive (HDD) to mirror the data to another one.

* **Number of disks**: minimum 2, maximum 2
* **Fault tolerance**: Average, if the primary disk fails then it is automatically disabled and the secondary activated.
* **I/O Performance**: Fast as a single HDD.

Run the following command to list available ISCSI HDD.

```bash
lsblk --scsi
```

Run the following command to create a RAID-1 device composed of the following 2 HDDs.

* `/dev/sdd1`
* `/dev/sde1`

```bash
mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sd[de]1
```

Labelize and partition RAID-1 device as such that the whole space is allocated.

```bash
parted /dev/md1 'mklabel msdos'
parted /dev/md1 'mkpart primary 0% 100%'
```

Check if RAID-1 and partition has been successfuly detected by the operating system.

```bash
lsblk --merge
```

Format the partition.

```bash
mkfs -t ext4 /dev/md1p1
```

Moutn the partition for future use.

```bash
mkdir -p /mnt/raid1
mount -t ext4 /dev/md1p1 /mnt/raid1
```