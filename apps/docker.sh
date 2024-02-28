set -e

install() {
  sudo apt update
  sudo apt-get install -y uidmap
  echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
  curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/apps/docker.sh | bash -s install-rootless
  
  export PATH=$HOME/bin:$PATH # workaround for ubuntu ~/.bashrc # make this function needed to be called by `source`
  
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

$@
