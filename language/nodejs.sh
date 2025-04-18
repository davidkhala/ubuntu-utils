#!/usr/bin/env bash
set -e
install() {
    sudo apt-get -qq install -y nodejs npm
    node --version # v18.19.1 (ubuntu 24)
    npm --version # 9.2.0 (ubuntu 24)

}
install-LTS() {
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
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
