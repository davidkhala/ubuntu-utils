install(){
  # First you need a vnc-server as dependency
  curl https://raw.githubusercontent.com/davidkhala/ubuntu-utils/master/system/connect/vnc.sh | bash -s install-server
  
  sudo apt install -y xrdp
  sudo systemctl enable --now xrdp
  sudo ufw allow from any to any port 3389 proto tcp
  sudo iptables --flush
}

$@
