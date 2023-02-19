#!/usr/bin/env bash
set -e

DISK_AMOUNT='12'
INITIATOR_ADDRESS='127.0.0.1'
INITIATOR_PORT='53260'
ISCSI_IQN='iqn.0000-00.target.local'

# install tgt and open-iscsi
sudo apt-get update -y \
&& sudo apt-get install -y tgt open-iscsi \
&& sudo mkdir -p /var/lib/devices

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
<target ${ISCSI_IQN}:${lun_name}>
  backing-store /var/lib/devices/disk-${disk_id}.img
  initiator-address ${INITIATOR_ADDRESS}
  incominguser iscsi-user random_password
  outgoinguser iscsi-target random_password_out
</target>
EOF
done

cat <<EOF | tee -a /etc/systemd/system/tgt.service
[Unit]
Description=(i)SCSI target daemon
Documentation=man:tgtd(8)
After=network.target

[Service]
Type=notify
TasksMax=infinity
ExecStart=/usr/sbin/tgtd -f
ExecStartPost=/usr/sbin/tgtadm --op update --mode sys --name State -v offline
ExecStartPost=/usr/sbin/tgt-admin -e -c /etc/tgt/targets.conf

ExecStartPost=/usr/sbin/tgtadm --mode portal --op delete --mode portal --param portal=0.0.0.0:3260
ExecStartPost=/usr/sbin/tgtadm --mode portal --op delete --mode portal --param portal=[::]:3260
ExecStartPost=/usr/sbin/tgtadm --mode portal --op new --mode portal --param portal=${INITIATOR_ADDRESS}:${INITIATOR_PORT}

ExecStartPost=/usr/sbin/tgtadm --op update --mode sys --name State -v ready

ExecStop=/usr/sbin/tgtadm --op update --mode sys --name State -v offline
ExecStop=/usr/sbin/tgt-admin --offline ALL
ExecStop=/usr/sbin/tgt-admin --update ALL -c /dev/null -f
ExecStop=/usr/sbin/tgtadm --op delete --mode system

ExecReload=/usr/sbin/tgt-admin --update ALL -c /etc/tgt/targets.conf
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# enable iscsi tgt service
systemctl enable tgt.service
systemctl restart tgt.service

iscsiadm -m discovery -t st -p ${INITIATOR_ADDRESS}:${INITIATOR_PORT}

# optionally, verify the target is working
# tgtadm --mode target --op show

for i in $(seq 1 ${DISK_AMOUNT})
do
    disk_id="$(printf "%03d" ${i})"
    lun_name="lun$((${i} - 1))"
    # configure iscsi initiator
    cat <<EOF | tee -a "/etc/iscsi/nodes/${ISCSI_IQN}\:${lun_name}/${INITIATOR_ADDRESS}\,${INITIATOR_PORT}\,1/default"
node.session.auth.authmethod = CHAP
node.session.auth.username = iscsi-user
node.session.auth.password = random_password
node.session.auth.username_in = iscsi-target
node.session.auth.password_in = random_password_out
EOF

  # enable automatic startup and the systemd service
  sed -i 's/node.startup = manual/node.startup = automatic/g' "/etc/iscsi/nodes/${ISCSI_IQN}\:${lun_name}/${INITIATOR_ADDRESS}\,${INITIATOR_PORT}\,1/default"
done

systemctl enable open-iscsi
systemctl restart open-iscsi

# wait a few seconds to mount the device and verify
sleep 10
lsblk
