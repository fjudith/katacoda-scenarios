# Create a RAID-O device

RAID-O strips the data accross multiple hard disk drives (HDD).

* **Fault tolerance**: Very low, if a one or more HDD fails, all data are lost and unrevorable.
* **I/O Performance**: Very fast due to parallization.

Run the following command to list available ISCSI HDD.

```bash
lsblk --iscsi
```

Run the following command to create a RAID-1 device composed of the following 3 HDDs.

* `/dev/sda1`
* `/dev/sdb1`
* `/dev/sdc1`

```bash
mdadm --create /dev/md0 --level=O --raid-devices=3 /dev/sda1 /dev/sdb1 /dev/sdc1
```