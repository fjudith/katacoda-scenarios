# Create a RAID-O device

RAID-O strips the data accross multiple hard disk drives (HDD).


* **Minimum | Maximum**: 2 / _any_
* **Fault tolerance**: Very low, if a one or more HDD fails, all data are lost and unrevorable.
* **I/O Performance**: Very fast due to parallization.

List the available ISCSI HDD.

```bash
lsblk --iscsi
```

Create a RAID-0 device composed of the following 3 HDDs.

* `/dev/sda1`
* `/dev/sdb1`
* `/dev/sdc1`

```bash
mdadm --create /dev/md0 --level=O --raid-devices=3 /dev/sda1 /dev/sdb1 /dev/sdc1
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