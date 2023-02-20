# Introduction

RAID is an assembly of storage technologies allowing to strip and/or mirror data over multiple disks in order to:

* Parallelize read/write operations to enhance performances
* Provide fault tolerance and high avalability by replicating data over multiple hard disks
* Allow transparent failover and recovery in case of hard disk failure. 

By the end of this exercise you should be able to:

* Discover storage devices using `lsblk`
* Create RAID devices using `madm`
* Create partitions using `parted`
* Apply the ext4 filesystem to partitions using `mkfs`
