set -e
register() {
    sudo mkdir -p /etc/apt/keyrings
    wget -qO - https://packages.confluent.io/deb/7.9/archive.key | gpg --dearmor | sudo tee /etc/apt/keyrings/confluent.gpg >/dev/null
    CP_DIST=$(lsb_release -cs)
    echo "Types: deb
URIs: https://packages.confluent.io/deb/7.9
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/confluent.gpg

Types: deb
URIs: https://packages.confluent.io/clients/deb/
Suites: ${CP_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/confluent.gpg" | sudo tee /etc/apt/sources.list.d/confluent-platform.sources >/dev/null
    sudo apt-get update
}
install() {
    local community_edition=$1

    if [ -z "$community_edition" ]; then
        sudo apt-get install -y confluent-platform confluent-security
    else
        sudo apt-get install -y confluent-community-2.13
    fi
}

$@
