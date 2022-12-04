#!/usr/bin/env bash
set -e

if [ ! -e "/etc/wsl.conf" ]; then
sudo echo -e "[boot]" >> /etc/wsl.conf
sudo echo -e "systemd=true" >> /etc/wsl.conuf
fi

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
