#!/usr/bin/env bash
set -e
remain_params=""
for ((i = 2; i <= ${#}; i++)); do
    j=${!i}
    remain_params="$remain_params $j"
done
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
switchBranch() {
    local branchName=$1
    echo "switching to branch origin/$branchName"
    git checkout -b $branchName
    git fetch
    git branch --set-upstream-to=origin/$branchName $branchName
    git pull
}
$1 $remain_params
