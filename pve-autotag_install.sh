#!/bin/bash

set -xe

# install prerequisites
apt install -y ipcalc

# install pve-autotag
curl -sSL https://raw.githubusercontent.com/ali2key/pve-autotag/main/pve-autotag -o /usr/local/bin/pve-autotag.sh && chmod +x /usr/local/bin/pve-autotag.sh
curl -sSL https://raw.githubusercontent.com/ali2key/pve-autotag/main/pve-autotag.conf -o /usr/local/etc/pve-autotag.conf

# configure pve-autotag systemd
curl -sSL https://raw.githubusercontent.com/ali2key/pve-autotag/main/pve-autotag.service -o /lib/systemd/system/pve-autotag.service

# start pve-autotag
systemctl daemon-reload
systemctl enable pve-autotag.service
systemctl start pve-autotag.service
