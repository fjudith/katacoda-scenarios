# Create a RAID-0 device

[RAID-0](https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_0) strips the data accross multiple hard disk drives (HDD).

* **Number of disks**: minimum 2, maximum depends on the number disks that can be attached to the computer.
* **Available space**: Sum of all HDDs
* **Fault tolerance**: Not supported. If one the HDD fails the entire array if lost.
* **I/O Performance**: Larger the array is, faster it will be. (n. parallization).

List the available SCSI HDD.

```bash
lsblk --scsi
```

Create a RAID-0 device composed of the following 3 HDDs.

* `/dev/sda1`
* `/dev/sdb1`
* `/dev/sdc1`

```bash
mdadm --create /dev/md0 --level=0 --raid-devices=3 /dev/sda1 /dev/sdb1 /dev/sdc1
```

Add the `msdos` label to the RAID-0 device.

```bash
parted /dev/md0 'mklabel msdos'
```

Create a partition that covers the entire RAID-0 device size.

```bash
parted /dev/md0 'mkpart primary 0% 100%'
```

Check if RAID-0 and partition has been successfuly detected by the operating system.

```bash
lsblk --merge
```

Format the partition.

```bash
mkfs -t ext4 /dev/md0p1
```

Mount the partition for future use.

```bash
mkdir -p /mnt/raid0
mount -t ext4 /dev/md0p1 /mnt/raid0
```