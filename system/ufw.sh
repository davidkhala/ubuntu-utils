status() {
    sudo ufw status
}
enable() {
    echo "WARN: After a reboot, ufw is always disabled."
    sudo ufw --force enable
}
reload() {
    sudo ufw reload
}
addPort() {
    sudo ufw allow $1
    reload
}

$@
