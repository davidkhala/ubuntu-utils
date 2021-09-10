install() {
  curl -sSL https://get.docker.com/ | sh
  sudo apt-get install -y uidmap
  dockerd-rootless-setuptool.sh install
}
installCompose() {
  sudo apt install -y docker-compose
}
$@
