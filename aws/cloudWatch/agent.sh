#!/usr/bin/env bash
set -e
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)
remain_params=""
for ((i = 2; i <= $#; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
agentCommonConfigPath="/opt/aws/amazon-cloudwatch-agent/etc/common-config.toml"

install() {
    wget "https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
    sudo apt install ./amazon-cloudwatch-agent.deb
    rm ./amazon-cloudwatch-agent.deb
}
configGen() {
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
    echo config.json created at /opt/aws/amazon-cloudwatch-agent/bin/config.json
}
start() {
    # TODO is it for ec2 only?
    local configurationFilePath=${1:-/opt/aws/amazon-cloudwatch-agent/bin/config.json}
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:${configurationFilePath} -s
}
$1 $remain_params
