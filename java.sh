#!/usr/bin/env bash
set -e
install8() {
    # TODO Notworking:Connecting to download.oracle.com (download.oracle.com)|23.78.218.45|:443... connected.
    # HTTP request sent, awaiting response... 404 Not Found
    # 2019-04-18 22:48:02 ERROR 404: Not Found.
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt update
    sudo apt install -y oracle-java8-installer
    sudo apt install -y oracle-java8-set-default
}
$1
