#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Clean up
echo "Cleaning up caches..."
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
apt -y autoremove
apt -y clean

# Remove caches
find /var/cache -type f -exec rm -rf {} \;

# delete any logs that have built up during the install
find /var/log/ -name *.log -exec rm -f {} \;

history -cw

# Enable Swap Memory
# /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
# /sbin/mkswap /var/swap.1
# /sbin/swapon /var/swap.1

# Minimize The Disk Image
echo "Minimizing disk image..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync