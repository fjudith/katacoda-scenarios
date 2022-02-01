#!/usr/bin/env bash
set -e

# install tgt and open-iscsi
sudo apt-get update -y && \
sudo apt-get install -y tgt open-iscsi && \
sudo mkdir -p /var/lib/devices

disk_file=(disk-001.img disk-002.img)

for i in ${disk_file[@]}
do
    # assume we have want to store our iscsi disk image
    # at /var/lib/devices and use a 10G disk.
    # create the disk image
    fallocate -l 100G /var/lib/devices/${i}

    # configure iscsi tgt
    # we use CHAP authentication (bidirectional) and set the initiator 
    # address to only allow localhost to enhance iscsi security
    tee /etc/tgt/conf.d/katacoda_iscsi.conf > /dev/null <<EOF
<target iqn.0000-00.node-001.local:katacoda>
  backing-store /var/lib/devices/${i}
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

# configure iscsi initiator
iscsiadm -m discovery -t st -p 127.0.0.1
tee -a /etc/iscsi/nodes/iqn.0000-00.node-001.local\:katacoda/127.0.0.1\,3260\,1/default > /dev/null <<EOF
node.session.auth.authmethod = CHAP
node.session.auth.username = iscsi-user
node.session.auth.password = random_password
node.session.auth.username_in = iscsi-target
node.session.auth.password_in = random_password_out
EOF

# enable automatic startup and the systemd service
sed -i 's/node.startup = manual/node.startup = automatic/g' /etc/iscsi/nodes/iqn.0000-00.node-001.local\:katacoda/127.0.0.1\,3260\,1/default
systemctl enable open-iscsi
systemctl restart open-iscsi

# wait a few seconds to mount the device and verify
sleep 10
lsblk
