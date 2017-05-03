#!/bin/sh
# install apt-get package
echo -e "\n\napt-get update..."
echo "=============================="

. /ubuntu_source.list
sudo apt-get update

packages=(
    # flags should pass through the the `brew list check`
    'vim --with-lua'
    git
    # reattach-to-user-namespace
    tmux
    tree
    wget
    zsh
    go
    openssl
    curl
    antigen
    # delve
)

for package in "${packages[@]}"; do
    sudo apt-get install --force-yes --yes ${package}
done

sudo apt-get clean
sudo apt-get autoremove
