#!/usr/bin/env bash

main() {
    echo "Installing Pacman packages..."
    "$DOTFILES_PATH"/stowable/bin/pkgstrap --repo

    echo -e "\n  Databases\n#############"
    echo -n "[mariadb] Forcing default timezone to GMT/UTC..."
    if [[ -f /etc/mysql/my.cnf.d/server.cnf ]]; then
        sed -ie 's/^\(\[mariadb]\)$/\1\ndefault_time_zone="+0:00"/' /etc/mysql/my.cnf.d/server.cnf && echo " [DONE]"
        systemctl restart mariadb.service
    else echo " [SKIP]"; fi

    echo -e "\n  Networking\n##############"
    [[ -d /etc/systemd/resolved.conf.d ]] || mkdir -p /etc/systemd/resolved.conf.d
    sdnd-append MulticastDNS yes
    sdnd-append DNS "9.9.9.9#dns.quad9.net 2620:fe::9#dns.quad9.net"
    systemctl restart systemd-networkd.service
    sdrd-set FallbackDNS '1.1.1.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com' fallback-dns.conf
    sdrd-set DNSSEC 'allow-downgrade' dnssec.conf
    sdrd-set DNSOverTLS 'yes' dns-over-tls.conf
    systemctl restart systemd-resolved.service

    echo -e "\n  Customisations\n##################"
    echo "[interception] Enabling udevmon service for caps lock remapping..."
    systemctl enable udevmon.service

    echo -n "[polybar] Allowing 'pacman -Sy' and 'ps_mem' to run without sudo pass... "
    echo "$DASHIT_USER ALL=(ALL) NOPASSWD:/usr/bin/pacman -Sy,/usr/bin/ps_mem" \
        >> /etc/sudoers.d/"$DASHIT_USER" && echo "[DONE]"

    echo -e "\n  Virtual Machines\n####################"
    echo -n "[virtualbox] Adding $DASHIT_USER to the vboxusers group... "
    usermod -aG vboxusers "$DASHIT_USER" && echo " [DONE]"
}

sdnd-append() {
    echo -n "[systemd-networkd] Setting $1 to '$2'... "
    if grep -q "^$1=" /etc/systemd/network/20-wired.network 2>/dev/null; then echo "[SKIP]"; else
        echo "$1=$2" >> /etc/systemd/network/20-wired.network && echo "[DONE]"
    fi
}
sdrd-set() {
    echo -n "[systemd-resolved] Setting $1 to '$2'... "
    if [[ -f /etc/systemd/resolved.conf.d/$3 ]]; then echo "[SKIP]"; else
        echo -e "[Resolve]\n$1=$2" > /etc/systemd/resolved.conf.d/"$3" && echo "[DONE]"
    fi
}

main "$@"
