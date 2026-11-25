#!/usr/bin/env bash
set -e
install() {
    sudo apt-get -qq install -y nodejs npm
    node --version # v18.19.1 (ubuntu 24)
    npm --version # 9.2.0 (ubuntu 24)

}
install-LTS() {
    sudo apt-get install -y curl
    curl -fsSL https://deb.nodesource.com/setup_26.x | sudo -E bash -
    sudo apt-get install -y nodejs # npm command included

}
uninstall-LTS(){
    sudo apt-get purge nodejs npm
    sudo rm -r /etc/apt/sources.list.d/nodesource.list
    sudo rm -r /etc/apt/keyrings/nodesource.gpg
}
build-essential() {

    sudo npm install -g npm@latest
    sudo apt-get install -y build-essential
}
$@
