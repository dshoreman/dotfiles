#!/bin/bash

echo "Setting locale..."

sed -ie 's/^#en_GB/en_GB/g' /etc/locale.gen

locale-gen

echo "LANG=en_GB.UTF-8" > /etc/locale.conf
