set -e

install() {
  sudo apt update
  sudo apt-get install -y uidmap
  echo "export PATH=$HOME/bin:$PATH" >>~/.bashrc
  # https://github.com/rootless-containers/rootlesskit/issues/172#issuecomment-2122189550
  echo 0 | sudo tee /proc/sys/kernel/apparmor_restrict_unprivileged_userns
  curl https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/apps/docker/install.sh | bash -s install-rootless

  export PATH=$HOME/bin:$PATH # workaround for ubuntu ~/.bashrc # make this function needed to be called by `source`

}
add-distro-repository() {
  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt-get update

}
install-desktop() {
  add-distro-repository
  wget https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb

  sudo apt-get install -y ./docker-desktop-amd64.deb
  rm ./docker-desktop-amd64.deb
  # Additional steps required for login
  # https://docs.docker.com/desktop/setup/sign-in/#signing-in-with-docker-desktop-for-linux
}

$@
