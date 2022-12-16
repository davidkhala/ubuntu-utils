#!/usr/bin/env bash
add-source() {
    echo "deb https://repo.debiancn.org/ stretch main" | sudo tee /etc/apt/sources.list.d/debiancn.list
    wget https://repo.debiancn.org/pool/main/d/debiancn-keyring/debiancn-keyring_0~20161212_all.deb -O /tmp/debiancn-keyring.deb
    sudo apt install /tmp/debiancn-keyring.deb
    sudo apt update
    rm /tmp/debiancn-keyring.deb
}
install-shadowsocks() {
    sudo apt install shadowsocks-qt5
}
wiki() {
    echo https://github.com/debiancn/repo
}
if [[ -z "$1" ]]; then
    install
else
    $1
fi
