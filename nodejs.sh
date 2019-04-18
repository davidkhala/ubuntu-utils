#!/usr/bin/env bash
install8() {
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
}
$1