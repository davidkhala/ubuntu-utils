#!/usr/bin/env bash
export SYSLOG=/var/log/syslog
NOPASSWD() {
    # dangerous: allow user run sudo without password
    local userGroup="sudo"
    echo "$userGroup  ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
}

TIMEZONE() {
    sudo dpkg-reconfigure tzdata # will have interactive operation
}
system-upgrade() {
    sudo apt install -y upgrade-manager-core
    sudo do-release-upgrade
}
security-upgrade() {
    sudo unattended-upgrade
}

isLTS() {
    lsb_release -d | grep "Ubuntu 20."
    return $?
}

$@
