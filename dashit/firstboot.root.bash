#!/usr/bin/env bash

echo -n "Patching mysql default timezone..."
sed -ie 's/^\(\[mariadb]\)$/\1\ndefault_time_zone="+0:00"/' /etc/mysql/my.cnf.d/server.cnf && echo " [DONE]"
systemctl restart mariadb.service

# Required for CUPS to locate *.local network printers. See:
# 1. https://wiki.archlinux.org/index.php/CUPS#Network
# 2. https://wiki.archlinux.org/index.php/Avahi#Hostname_resolution
echo -n "Patching nsswitch for .local name resolution..."
sed -ie 's/^\(hosts: .*\) resolve/\1 mdns_minimal [NOTFOUND=return] resolve/' /etc/nsswitch.conf && echo " [DONE]"
systemctl restart avahi-daemon.service
systemctl restart org.cups.cupsd.service

echo -n "Adding $DASHIT_USER to the vboxusers group... "
usermod -aG vboxusers "$DASHIT_USER" && echo " [DONE]"
