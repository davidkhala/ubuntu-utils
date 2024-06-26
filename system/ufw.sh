status() {
    sudo ufw status
}
enable() {
    echo "WARN: After a reboot, ufw is always disabled."
    sudo ufw --force enable
}
allowBastion() {
    sudo ufw allow ssh
    sudo ufw allow icmp
    reload
}
reload() {
    sudo ufw reload
}
addPort() {
    sudo ufw allow $1
    reload
}

$@
