install() {
  curl -sSL https://get.docker.com/ | sh
  sudo apt-get install -y uidmap
  dockerd-rootless-setuptool.sh install
  echo "export DOCKER_HOST=unix:///run/user/$UID/docker.sock" >> ~/.bashrc
}
install2(){
  sudo snap install docker
}

install-compose() {
  curl https://raw.githubusercontent.com/davidkhala/docker-manager/master/distro-repository.sh | bash -s ubuntu
  curl https://raw.githubusercontent.com/davidkhala/docker-manager/master/docker-compose/install.sh | bash -s dpkg
  
}
$@
