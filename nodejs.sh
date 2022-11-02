#!/usr/bin/env bash

install() {
    sudo apt-get -qq install -y nodejs
    node --version # v12.22.9 (ubuntu 22)

}
install-LTS() {
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
}
build-essential() {

    sudo npm install -g npm@latest
    sudo apt-get install -y build-essential
}
$@
