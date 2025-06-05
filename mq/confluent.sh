set -e

install() {
    wget -qO - https://packages.confluent.io/confluent-cli/deb/archive.key | sudo apt-key add -
    sudo apt install software-properties-common
    sudo add-apt-repository "deb https://packages.confluent.io/confluent-cli/deb stable main"
    sudo apt update && sudo apt install confluent-cli
}

$@
