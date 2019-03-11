#!/usr/bin/env bash
function symbolicLink(){
    local targetSrc=$1
    local link=$2
    ln -s $1 $2
}