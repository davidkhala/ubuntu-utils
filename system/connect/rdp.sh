install(){
  # First you need a vnc-server as dependency
  curl https://raw.githubusercontent.com/davidkhala/ubuntu-utils/master/system/connect/vnc.sh | bash -s install-server
  
  sudo apt install -y xrdp
  sudo systemctl enable --now xrdp
  sudo firewall-cmd --permanent --add-port=3389/tcp
  sudo firewall-cmd --reload
}
setup() {
  sudo passwd root
  echo "Please use user `root` or other user with password Auth to initialize the Ubuntu Desktop via RDP first"
  echo "- The default ssh key-pair user like `ubuntu` cannot login to RDP, even though it has password set"
  
}

$@
