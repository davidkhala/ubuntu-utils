#!/usr/bin/env bash
set -e
install11(){
    sudo add-apt-repository -y ppa:linuxuprising/java
	sudo apt update
	sudo apt install -y oracle-java11-installer
	sudo apt install -y oracle-java11-set-default
}
$@
