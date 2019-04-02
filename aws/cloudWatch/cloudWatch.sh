#!/usr/bin/env bash
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)
workDir="$CURRENT/aws-scripts-mon"

remain_params=""
for ((i = 2; i <= $#; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
prepare(){
    sudo apt-get install -y unzip
    sudo apt-get install -y libwww-perl libdatetime-perl
}

config(){
    
    if [[ ! -f "$workDir/awscreds.conf" ]]; then
		cp $workDir/awscreds.template $workDir/awscreds.conf
	fi
    vi $workDir/awscreds.conf
}
push(){
    local key=$1
    local secret=$2 
    CMD="$workDir/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/"
    if [[ -n "$secret" ]];then
        CMD="$CMD --aws-access-key-id=$key --aws-secret-key=$secret"
    fi
    echo $CMD
    $CMD
}
cron(){
    sysCronTab="/etc/crontab"
	if ! grep "disk-space-util" $sysCronTab; then
		echo "* * * * *  $USER $workDir/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron" | sudo tee -a $sysCronTab
		sudo /etc/init.d/cron restart
	fi
}

$1 $remain_params
