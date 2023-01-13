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
$@
