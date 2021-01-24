#!/usr/bin/env bash

install(){
    sudo apt install -y chrony
}
config(){
    vi /etc/chrony/chrony.conf
}
serviceRestart(){
    sudo /etc/init.d/chrony restart
}
status(){
    chronyc sources -v
    chronyc tracking
}

sync(){
    sudo chronyc makestep
}

$@