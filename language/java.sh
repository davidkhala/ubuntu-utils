#!/usr/bin/env bash
set -e
install17(){
    	sudo add-apt-repository -y ppa:linuxuprising/java
	sudo apt update
	sudo apt install -y oracle-java17-installer oracle-java17-set-default
	
}
install-open(){
	sudo apt install -y default-jdk
}
install-corretto(){
  wget https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.deb
  sudo apt-get install -y ./amazon-corretto-17-x64-linux-jdk.deb
  rm amazon-corretto-17-x64-linux-jdk.deb
}
$@
