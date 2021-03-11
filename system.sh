#!/usr/bin/env bash
NOPASSWD() {
    # dangerous: allow user run sudo without password
    local userGroup="sudo"
    echo "$userGroup  ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
}
TIMEZONE() {
    sudo dpkg-reconfigure tzdata # will have interactive operation
}
systemUpgrade() {
    sudo do-release-upgrade
}
securityUpgrade() {
    sudo unattended-upgrade
}
extendPartition() {
    echo "[sample] sudo growpart /dev/xvda 1"
}

extendFileSystem() {
    echo "sudo resize2fs /dev/xvda1"
}
isLTS() {
	lsb_release -d | grep "Ubuntu 20."
	return $?
}
$@
