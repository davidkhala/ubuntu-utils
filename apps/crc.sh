set -e
install() {
    sudo apt install -y curl virtiofsd virt-manager
    
    curl https://raw.githubusercontent.com/davidkhala/redhat/refs/heads/main/Openshift/local/local.sh | bash -s install
    sudo reboot
    
    
}
$@