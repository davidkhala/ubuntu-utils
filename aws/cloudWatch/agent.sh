#!/usr/bin/env bash
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)
agentCommonConfigPath="/opt/aws/amazon-cloudwatch-agent/etc/common-config.toml"

install(){
    wget "https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
    sudo apt install ./amazon-cloudwatch-agent.deb
}
configGen(){
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
    echo config.json will be created at "\$PWD": $PWD
}
start(){
    # TODO is it for ec2 only? 
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:${configurationFilePath} -s
}
$1