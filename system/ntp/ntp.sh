#!/usr/bin/env bash

install(){
    sudo apt install ntpdate
}
sync(){
    sudo ntpdate -u "time.windows.com"
}

$@