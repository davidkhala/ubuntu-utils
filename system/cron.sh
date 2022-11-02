#!/usr/bin/env bash
# Cron syntax viewer website: https://crontab.guru/
sysCronTab="/etc/crontab"
addJob() {
    local newLine=$remain_params
    echo "*  *	* * *	root	$newLine" | sudo tee -a $sysCronTab
    sudo /etc/init.d/cron restart
}
viewLog() {
    sudo /etc/init.d/cron restart
    SYSLOG=/var/log/syslog
    sudo grep cron $SYSLOG
}
"$@"
