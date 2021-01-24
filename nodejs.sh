#!/usr/bin/env bash

install8() {
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
}
install10() {
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
}
install12() {
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
}
$@
