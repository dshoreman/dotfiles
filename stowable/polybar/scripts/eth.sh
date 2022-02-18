#!/bin/bash

print_bytes() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
        bytes="0 kB/s"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "$1/1000" | bc -l | LANG=C xargs printf "%.f\n") kB/s"
    else
        bytes="$(echo "$1/1000000" | bc -l | LANG=C xargs printf "%.1f\n") MB/s"
    fi

    echo "$bytes"
}

print_bit() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 10 ]; then
        bit="0 B"
    elif [ "$1" -lt 100 ]; then
        bit="$(echo "$1*8" | bc -l | LANG=C xargs printf "%.f\n") B"
    elif [ "$1" -lt 100000 ]; then
        bit="$(echo "$1*8/1000" | bc -l | LANG=C xargs printf "%.f\n") K"
    else
        bit="$(echo "$1*8/1000000" | bc -l | LANG=C xargs printf "%.1f\n") M"
    fi

    echo "$bit"
}

INTERVAL=3
INTERFACES="enp6s0"

declare -A addresses
declare -A bytes

for interface in $INTERFACES; do
    bytes[past_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    bytes[past_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"
    addresses[$interface]="$(ip addr show ${interface} | grep 'inet ' | awk '{ print $2 }' | cut -d'/' -f1)"
done

while true; do
    line=""
    down=0
    up=0

    for interface in $INTERFACES; do
        bytes[now_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
        bytes[now_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

        bytes_down=$((((${bytes[now_rx_$interface]} - ${bytes[past_rx_$interface]})) / INTERVAL))
        bytes_up=$((((${bytes[now_tx_$interface]} - ${bytes[past_tx_$interface]})) / INTERVAL))

        down=$(((( "$down" + "$bytes_down" ))))
        up=$(((( "$up" + "$bytes_up" ))))

        bytes[past_rx_$interface]=${bytes[now_rx_$interface]}
        bytes[past_tx_$interface]=${bytes[now_tx_$interface]}

        line="${line}  ${addresses[$interface]}  $(print_bytes $down)    $(print_bytes $up)"
        # line="${line}  ${addresses[$interface]}  $(print_bit $down)    $(print_bit $up)"
    done

    echo "$line"
    sleep $INTERVAL
done
