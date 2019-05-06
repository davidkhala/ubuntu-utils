#!/usr/bin/env bash
set -e
install9() {
    local installTarget=$1
    if [ ! -d "$installTarget" ]; then
        echo "please specify install target folder path"
        exit 1
    fi
    wget https://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.19/bin/apache-tomcat-9.0.19.tar.gz
    tar xzf apache-tomcat-9.0.19.tar.gz
    sudo mv apache-tomcat-9.0.19 $installTarget
}
