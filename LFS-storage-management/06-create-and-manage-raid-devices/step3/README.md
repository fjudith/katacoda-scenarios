# Create a RAID-5 device

[RAID-5](https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_5) strips the data accross multiple hard disk drives (HDD) but the equivalent of **one** HDD total space will be used for paritiry blocks spread in the array.
Those parity blocks are used to rebuild the data once a failed HDD was replace by a new one.

* **Number of disks**: minimum 3, maximum 16
* **Available space**: Sum of all HDDs - 1 HDD
* **Fault tolerance**: Only support a single HDD failure for a limited time
* **I/O Performance**: Smaller the arrays are usually faster than large ones

List available SCSI HDD.

```bash
lsblk --scsi
```

Create a RAID-5 device composed of the following 3 HDDs.

* `/dev/sdf1`
* `/dev/sdg1`
* `/dev/sdh1`

```bash
mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sd[f-h]1
```

Labelize and partition RAID-5 device as such that only 768MB of space is allocated.

> The `--align` parameter fine tune the block allocation on the hardware.

```bash
parted /dev/md2 'mklabel msdos'
parted /dev/md2 --align=optimal 'unit MB mkpart primary 0 768'
```

Check if RAID-5 and partition has been successfuly detected by the operating system.

```bash
lsblk --merge
```

Format the partition.

```bash
mkfs -t ext4 /dev/md2p1
```

Mount the partition for future use.

```bash
mkdir -p /mnt/raid5
mount -t ext4 /dev/md2p1 /mnt/raid5
```