set -e
prepare(){
      sudo apt install -y git make build-essential nodejs npm curl
    sudo npm install -g corepack

    curl -sSL https://raw.githubusercontent.com/davidkhala/ubuntu-utils/refs/heads/master/apps/docker.sh | bash -s install
    echo Y | yarn --version
    
    sudo apt install -y zlib1g-dev libc-ares-dev libbrotli-dev libnghttp2-dev libicu-dev # for yarn install

}
$@
