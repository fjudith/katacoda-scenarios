# Create a RAID-5 device

RAID-5 allow a given hard disk drive (HDD) to mirror the data to another one.

* **Number of disks**: minimum 3, maximum 16
* **Fault tolerance**: Good, if one disk fails, the primary disk fails then it is automatically disabled and the secondary activated.
* **I/O Performance**: Fast as a single HDD.

Run the following command to list available ISCSI HDD.

```bash
lsblk --scsi
```

Run the following command to create a RAID-5 device composed of the following 3 HDDs.

* `/dev/sdf1`
* `/dev/sdg1`
* `/dev/sdh1`

```bash
mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sd[f-h]1
```

Labelize and partition RAID-5 device as such that only 1.5GB of space is allocated.

> The `--align` parameter fine tune the block allocation on the hardware.

```bash
parted /dev/md2 'mklabel msdos'
parted /dev/md2 --align=optimal 'unit GB mkpart primary 0 1.5'
```

Check if RAID-5 and partition has been successfuly detected by the operating system.

```bash
lsblk --merge
```

Format the partition.

```bash
mkfs -t ext4 /dev/md2p1
```

Moutn the partition for future use.

```bash
mkdir -p /mnt/raid5
mount -t ext4 /dev/md2p1 /mnt/raid5
```