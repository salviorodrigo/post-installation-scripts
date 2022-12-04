#!/usr/bin/env bash
set -e

if [ ! -e "/etc/wsl.conf" ]; then
echo -e "[boot]" >> /etc/wsl.conf
echo -e "systemd=true" >> /etc/wsl.conuf
fi

apt update && apt upgrade -y && apt autoremove -y
