# Create a RAID-6 device

[RAID-6](https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_6) strips the data accross multiple hard disk drives (HDD) but the equivalent of **two** HDDs total space will be used for paritiry blocks spread in the array.
Those parity blocks are used to rebuild the data once a failed HDD was replace by a new one.

* **Number of disks**: minimum 4, maximum 16
* **Available space**: Sum of all HDDs - 2 HDDs
* **Fault tolerance**: Support a doube HDD failure for a limited time
* **I/O Performance**: Smaller the arrays are usually faster than large ones

List available SCSI HDD.

```bash
lsblk --scsi
```

Create a RAID-5 device composed of the following 4 HDDs.

* `/dev/sdi1`
* `/dev/sdj1`
* `/dev/sdk1`
* `/dev/sdl1`

```bash
mdadm --create /dev/md3 --level=6 --raid-devices=4 /dev/sd[i-l]1
```

Labelize and partition RAID-6 device as such where only three quarters of space is allocated.

> The `--align` parameter fine tune the block allocation on the hardware.

```bash
parted /dev/md3 'mklabel msdos'
parted /dev/md3 --align=optimal 'unit % mkpart primary 0 75%'
```

Check if RAID-5 and partition has been successfuly detected by the operating system.

```bash
lsblk --merge
```

Format the partition.

```bash
mkfs -t ext4 /dev/md3p1
```

Mount the partition for future use.

```bash
mkdir -p /mnt/raid6
mount -t ext4 /dev/md3p1 /mnt/raid6
```