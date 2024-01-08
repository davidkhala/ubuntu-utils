#!/usr/bin/env bash
set -e
agentCommonConfigPath="/opt/aws/amazon-cloudwatch-agent/etc/common-config.toml"

install() {
    wget "https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
    sudo apt install ./amazon-cloudwatch-agent.deb
    rm ./amazon-cloudwatch-agent.deb
}
configGen() {
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
    vi /opt/aws/amazon-cloudwatch-agent/bin/config.json
}
start() {
    # TODO is it for ec2 only?
    local configurationFilePath=${1:-/opt/aws/amazon-cloudwatch-agent/bin/config.json}
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:${configurationFilePath} -s
}
$@
