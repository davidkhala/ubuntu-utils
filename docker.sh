install() {
  curl -sSL https://get.docker.com/ | sh
  sudo apt-get install -y uidmap
  dockerd-rootless-setuptool.sh install
}
installCompose() {
  sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}
$@
