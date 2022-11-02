dependencies() {
    sudo apt install -y python
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt -qq install -y nodejs
    sudo apt install -y build-essential
}
$@