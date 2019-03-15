#!/usr/bin/env bash
echo "ntp use port: UDP 123"
install(){
    sudo apt install ntpdate
}
sync(){
    sudo ntpdate -u "time.windows.com"
}

$1