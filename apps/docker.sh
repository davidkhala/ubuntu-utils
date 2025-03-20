set -e

install() {
  sudo apt update
  sudo apt-get install -y uidmap
  echo "export PATH=$HOME/bin:$PATH" >>~/.bashrc
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
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

  sudo apt-get update

}
install-desktop() {
  add-distro-repository
  wget -O docker-desktop-amd64.deb https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-amd64.deb

  sudo apt-get install -y ./docker-desktop-amd64.deb

}

$@
