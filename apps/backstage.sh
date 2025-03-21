set -e
prepare(){
      sudo apt install -y curl git make build-essential
      curl -fsSL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
      sudo -E bash nodesource_setup.sh
      sudo apt install -y nodejs 
      rm bash nodesource_setup.sh
      
    

    curl -sSL https://raw.githubusercontent.com/davidkhala/ubuntu-utils/refs/heads/master/apps/docker.sh | bash -s install
        
    sudo apt install -y zlib1g-dev libc-ares-dev libbrotli-dev libnghttp2-dev libicu-dev # for yarn install

}
$@
