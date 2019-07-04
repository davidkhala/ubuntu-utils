#!/usr/bin/env bash
symbolicLink(){
    local targetSrc=$1
    local link=$2
    sudo ln -s $1 $2
}
$1 $2 $3