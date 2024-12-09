# PVE-AUTOTAG

PVE-AUTOTAG is a simple script to add auto tags to LXCs/VMs with IPs and guest OS metadata (distro, version, etc) in Proxmox VE.

![](./img/pve-lxc-iptag.png)

## 1. Installation

```sh
curl -sL https://github.com/ali2key/pve-autotag/raw/main/install.sh | bash
```

This script will:

- Install script prerequisites
- Install the `pve-autotag` script to `/usr/local/bin/pve-autotag`
- Copy config file to `/usr/local/etc/pve-autotag.conf`
- Add a systemd unit to start the service

### 1.1 Update

```sh
curl -sSL https://raw.githubusercontent.com/ali2key/pve-autotag/main/pve-autotag -o /usr/local/bin/pve-autotag && chmod +x /usr/local/bin/pve-autotag
systemctl restart pve-autotag.service
```

This script will only update the `pve-autotag` executable script

## 2. Configure

Open `/usr/local/ect/pve-autotag.conf` and change the config

| Option                          | Example                                     | Description                                                                                             |
| ------------------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| CIDR_LIST                       | `(192.168.0.0/16 100.64.0.0/10 10.0.0.0/8)` | IP filter list in CIDR format                                                                           |
| LOOP_INTERVAL                   | `60`                                        | Main loop interval(seconds)                                                                             |
| FW_NET_INTERFACE_CHECK_INTERVAL | `60`                                        | The interval(seconds) for using `ifconfig` to check lxc status changed (Set -1 to disable this feature) |
| LXC_STATUS_CHECK_INTERVAL       | `-1`                                        | The interval(seconds) for using `pct list` to check lxc status changed (Set -1 to disable this feature) |
| FORCE_UPDATE_INTERVAL           | `1800`                                      | The interval(seconds) for force check and update lxc tags                                               |
