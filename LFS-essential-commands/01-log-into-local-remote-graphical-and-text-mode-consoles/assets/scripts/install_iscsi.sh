#!/usr/bin/env bash
set -e

# install tgt and open-iscsi
sudo apt-get update -y && \
sudo apt-get install -y tgt open-iscsi && \
sudo mkdir -p /var/lib/devices

DISK_AMOUNT=12

for i in $(seq 1 ${DISK_AMOUNT})
do
    disk_id="$(printf "%03d" ${i})"
    lun_name="lun$((${i} - 1))"
    # assume we have want to store our iscsi disk image
    # at /var/lib/devices and use a 10G disk.
    # create the disk image
    fallocate -l 1G /var/lib/devices/disk-${disk_id}.img

    # configure iscsi tgt
    # we use CHAP authentication (bidirectional) and set the initiator 
    # address to only allow localhost to enhance iscsi security
    cat <<EOF | tee -a /etc/tgt/conf.d/killercoda_iscsi.conf
<target iqn.0000-00.target.local:${lun_name}>
  backing-store /var/lib/devices/disk-${disk_id}.img
  initiator-address 127.0.0.1
  incominguser iscsi-user random_password
  outgoinguser iscsi-target random_password_out
</target>
EOF
done

# enable iscsi tgt service
systemctl enable tgt
systemctl restart tgt

# optionally, verify the target is working
tgtadm --mode target --op show

for i in $(seq 1 ${DISK_AMOUNT})
do
    disk_id="$(printf "%03d" ${i})"
    lun_name="lun$((${i} - 1))"
    # configure iscsi initiator
    iscsiadm -m discovery -t st -p 127.0.0.1
    cat <<EOF | tee -a "/etc/iscsi/nodes/iqn.0000-00.target.local\:${lun_name}/127.0.0.1\,3260\,1/default"
node.session.auth.authmethod = CHAP
node.session.auth.username = iscsi-user
node.session.auth.password = random_password
node.session.auth.username_in = iscsi-target
node.session.auth.password_in = random_password_out
EOF

  # enable automatic startup and the systemd service
  sed -i 's/node.startup = manual/node.startup = automatic/g' /etc/iscsi/nodes/iqn.0000-00.node-${disk_id}.local\:killercoda/127.0.0.1\,3260\,1/default
done

systemctl enable open-iscsi
systemctl restart open-iscsi

# wait a few seconds to mount the device and verify
sleep 10
lsblk
