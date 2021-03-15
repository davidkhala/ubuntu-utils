#!/usr/bin/env bash

setPython3(){
    python-is-python3
}
installPIP3(){
    sudo apt install python3-pip
}
installPIP2(){
    sudo apt install python-pip
}
installDjango(){
    pip3 install django
}
installPython2(){
    sudo apt install python
}
$1
