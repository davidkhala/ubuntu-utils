#!/usr/bin/env bash


install12() {
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
}
install(){
    sudo apt-get -qq install -y nodejs
    node --version # v12.22.9 (ubuntu 22)
    
}
installLTS(){
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get -qq install -y nodejs
    sudo npm install -g npm@latest
}
$@
