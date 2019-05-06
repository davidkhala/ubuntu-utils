#!/usr/bin/env bash
set -e
fcn=$1
remain_params=""
for ((i = 2; i <= $#; i++)); do
    j=${!i}
    remain_params="$remain_params $j"
done
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
$fcn $remain_params
