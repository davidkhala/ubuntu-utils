set -e
install-vi() {
    sudo apt-get install -y vim
}
install-jq() {
    sudo apt -qq install -y jq
}
install-xclip() {
    sudo apt-get install -y xclip
}
$@
