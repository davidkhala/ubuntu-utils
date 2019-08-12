#!/usr/bin/env bash
set -e
remain_params=""
for ((i = 2; i <= ${#}; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
sshPass() {
    if ! sshPass >/dev/null 2>&1; then
        sudo apt install sshpass
    fi
}
skipHostStrict(){
    local _host=${1:-git@github.com}
    set +e
    ssh -o StrictHostKeyChecking=no ${_host}
    set -e
}
genRSA() {
    local keySize
    local email
    local rsaKeyPrv
    local inline=$1
    if [ -z "$inline" ]; then
        read -p "enter email (default:david-khala@hotmail.com):" email
        read -p "enter keySize (default:4096) :" keySize
    fi
    keySize=${keySize:-4096}
    email=${email:-"david-khala@hotmail.com"}
    ssh-keygen -t rsa -b $keySize -C $email
    eval "$(ssh-agent -s)"

    if [ -z "$inline" ]; then
        read -p "Enter key file path again ($HOME/.ssh/id_rsa):" rsaKeyPrv
    fi
    rsaKeyPrv=${rsaKeyPrv:-"$HOME/.ssh/id_rsa"}
    ssh-add $rsaKeyPrv
}
copyRSAPub() {
    sudo apt install -qq -y xclip
    # xclip does not work on ubuntu server: [Error: Can't open display: (null)]
    if ! xclip -sel clip <~/.ssh/id_rsa.pub; then
        echo ---- xclip does not work on current terminal. Please manually copy following:
        cat ~/.ssh/id_rsa.pub
    fi
}
$1 ${remain_params}
