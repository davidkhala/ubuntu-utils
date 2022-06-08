install() {
  curl -sSL https://get.docker.com/ | sh
  sudo apt-get install -y uidmap
  dockerd-rootless-setuptool.sh install
  echo "export DOCKER_HOST=unix:///run/user/$UID/docker.sock" >> ~/.bashrc
}
install2(){
  sudo snap install docker
}

installCompose() {
  sudo apt install -y docker-compose
}
$@
