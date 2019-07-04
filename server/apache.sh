#!/usr/bin/env bash
install() {
    sudo apt install -y apache2
}
service() {
    local action=$1
    sudo service apache2 $action
}

$1 $2
