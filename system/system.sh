#!/usr/bin/env bash
export SYSLOG=/var/log/syslog
NOPASSWD() {
    # dangerous: allow user run sudo without password
    local userGroup="sudo"
    echo "$userGroup  ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
}
SETPASSWD() {
    sudo passwd
}
TIMEZONE() {
    sudo dpkg-reconfigure tzdata # will have interactive operation
}
systemUpgrade() {
    sudo apt install -y upgrade-manager-core
    sudo do-release-upgrade
}
securityUpgrade() {
    sudo unattended-upgrade
}

isLTS() {
    lsb_release -d | grep "Ubuntu 20."
    return $?
}

$@
