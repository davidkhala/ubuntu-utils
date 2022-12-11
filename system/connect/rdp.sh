install(){
  # First you need a vnc-server as dependency
  curl https://raw.githubusercontent.com/davidkhala/ubuntu-utils/master/system/connect/vnc.sh | bash -s install-server
  
  sudo apt install -y xrdp
  sudo systemctl enable --now xrdp
  sudo firewall-cmd --permanent --add-port=3389/tcp
  sudo firewall-cmd --reload
  echo "Usage Tips: https://github.com/davidkhala/linux-utils/wiki/Connect-RDP"
}


$@
