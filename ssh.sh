#!/usr/bin/env bash

sshPass() {
    if ! sshPass >/dev/null 2>&1; then
        sudo apt install sshpass
    fi
}