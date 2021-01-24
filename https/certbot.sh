#!/usr/bin/env bash
install() {
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt update
    sudo apt install certbot
}
prepare() {
    certbot certonly --manual
}

$@
