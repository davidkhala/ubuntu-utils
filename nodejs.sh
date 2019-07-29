#!/usr/bin/env bash
remain_params=""
for ((i = 2; i <= $#; i++)); do
    j=${!i}
    remain_params="$remain_params $j"
done
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
$1 $remain_params
