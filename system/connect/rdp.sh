install(){
  sudo apt install -y xrdp
  sudo systemctl enable --now xrdp

}

$@
