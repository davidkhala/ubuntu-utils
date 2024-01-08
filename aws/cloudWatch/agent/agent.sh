#!/usr/bin/env bash
set -e
defaultConfigPath=/opt/aws/amazon-cloudwatch-agent/bin/config.json

install() {
    wget "https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
    sudo apt install ./amazon-cloudwatch-agent.deb
    rm ./amazon-cloudwatch-agent.deb
}
configGen() {
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
    vi $defaultConfigPath
}
start() {
    local configurationFilePath=${1:-$defaultConfigPath}
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -s -c file:${configurationFilePath}

}
$@
