install-corretto(){
  wget https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.deb
  sudo apt-get install -y ./amazon-corretto-17-x64-linux-jdk.deb
  rm amazon-corretto-17-x64-linux-jdk.deb
}
$@
