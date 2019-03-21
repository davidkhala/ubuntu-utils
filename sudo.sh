#!/usr/bin/env bash
fcn=$1
NOPASSWD(){
    # dangerous: allow user run sudo without password
    local userGroup="sudo"
    echo "$userGroup  ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
}
TIMEZONE(){
    sudo dpkg-reconfigure tzdata # will have interactive operation
}
$fcn