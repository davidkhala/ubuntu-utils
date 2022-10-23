#!/usr/bin/env bash
install-netstat() {
    sudo apt install net-tools
}
reset-firewall(){
  ## Reference: https://stackoverflow.com/questions/54794217/opening-port-80-on-oracle-cloud-infrastructure-compute-node/54810101#54810101
  sudo iptables --flush
  
}
install-firewalld(){
  sudo apt -y install firewalld
}

$@
