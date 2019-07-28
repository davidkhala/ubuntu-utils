#!/usr/bin/env bash
set -e

CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)

fcn=$1
remain_params=""
for ((i = 2; i <= ${#}; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done

getLastLine(){
    echo "use 'tail -1' after pipeline"
}