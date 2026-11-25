set -e
install() {
    sudo apt install -y curl virtiofsd virt-manager
    
    curl https://raw.githubusercontent.com/davidkhala/redhat/refs/heads/main/Openshift/local/bash/setup.sh | bash -s install
    sudo reboot
    
    
}
$@
