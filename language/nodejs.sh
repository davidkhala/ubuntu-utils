#!/usr/bin/env bash

install() {
    sudo apt-get -qq install -y nodejs
    node --version # v12.22.9 (ubuntu 22)

}
install-LTS() {
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    
    sudo apt-get install -y nodejs npm
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
