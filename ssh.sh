#!/usr/bin/env bash
set -e

sshPass() {
    if ! sshPass >/dev/null 2>&1; then
        sudo apt install sshpass
    fi
}
copyRSAPub() {
    sudo apt install -qq -y xclip
    # xclip does not work on ubuntu server: [Error: Can't open display: (null)]
    if ! xclip -sel clip <~/.ssh/id_rsa.pub; then
        echo ---- xclip does not work on current terminal. Please manually copy following:
        cat ~/.ssh/id_rsa.pub
    fi
}
$@
