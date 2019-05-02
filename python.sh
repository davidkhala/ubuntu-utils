#!/usr/bin/env bash
setPython2(){
    alias python=python2
}
setPython3(){
    alias python=python3
}
installPIP3(){
    sudo apt install python3-pip
}
installPIP2(){
    sudo apt install python-pip
}
installDjango(){
    pip install django
}
$1