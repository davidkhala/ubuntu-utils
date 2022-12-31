install() {
  curl -sSL https://get.docker.com/ | sh
  sudo apt-get install -y uidmap
  dockerd-rootless-setuptool.sh install
  echo "export DOCKER_HOST=unix:///run/user/$UID/docker.sock" >>~/.bashrc
}
install-desktop() {
  # The Canonical re-distro of Docker
  # ubuntu server installation error: after installation, run `docker ps`
  #   internal error, please report: running "docker" failed: transient scope could not be started, job /org/freedesktop/systemd1/job/46 finished with result failed
  sudo snap install docker
}
remove-desktop() {
  sudo snap remove docker
}

install-compose() {
  # TODO
  curl https://raw.githubusercontent.com/davidkhala/docker-manager/master/distro-repository.sh | bash -s ubuntu
  curl https://raw.githubusercontent.com/davidkhala/docker-manager/master/docker-compose/install.sh | bash -s dpkg

}
$@
