install() {
    local osCode=$(lsb_release --codename --short)
    echo "deb http://apt.postgresql.org/pub/repos/apt/ ${osCode}-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt install postgresql-10
}
$1
