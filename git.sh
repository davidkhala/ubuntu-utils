#!/usr/bin/env bash
upgrade() {
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update
    sudo apt install git -y
}
prepare() {
    email=${email:-"david-khala@hotmail.com"}
    name=${name:-"david liu"}
    git config --global user.email $email
    git config --global user.name $name
}
$1