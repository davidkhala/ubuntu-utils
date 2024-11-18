
set-python() {
    sudo apt install -y python-is-python3
}
pip() {
    sudo apt install -y python3-pip
}
poetry(){
    sudo apt install -y python3-poetry
}

$@
