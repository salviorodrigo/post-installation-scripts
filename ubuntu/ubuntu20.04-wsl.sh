#!/usr/bin/env bash
set -e

if [ ! -e "/etc/wsl.conf" ]; then
sudo echo -e "[boot]" >> /etc/wsl.conf
sudo echo -e "systemd=true" >> /etc/wsl.conuf
fi

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

pacotes=(curl git zsh docker.io build-essential autoconf re2c bison software-properties-common dirmngr gpg gawk)
libs=(containerd libsqlite3-dev libpq-dev libonig-dev libfcgi-dev libfcgi0ldbl libjpeg-dev libpng-dev libssl-dev libxml2-dev libcurl4-openssl-dev libxpm-dev libgd-dev libmysqlclient-dev libfreetype6-dev libxslt1-dev libpspell-dev libzip-dev libgccjit-10-dev libreadline-dev)

sudo apt install ${libs[@]} -y
sudo apt install ${pacotes[@]} -y

sudo usermod -aG docker $USER
sudo chsh -s $(which zsh)

mkdir -p ~/.docker/cli-plugins
curl -sSL https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
echo "alias docker-compose=\"docker compose\"" >>~/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cp "$(pwd)/${0%/*}/.p10k.zsh" ~/.p10k.zsh
echo 'source ~/.p10k.zsh' >>~/.zshrc

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
echo . $HOME/.asdf/asdf.sh >>~/.zshrc

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 14.21.1
asdf install nodejs 18.12.1
asdf global nodejs 18.12.1
npm -g install yarn

asdf plugin-add php https://github.com/asdf-community/asdf-php.git
asdf install nodejs 8.1.13
asdf global php 8.1.13

git config --global user.name "Rodrigo Salvio"
git config --global user.email "rodrigosalvio@hotmail.com"