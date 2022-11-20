#!/usr/bin/env bash
install-netstat() {
  sudo apt install net-tools
}
allow-ssh() {
  # TODO 
  sudo /usr/sbin/iptables-legacy -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
}

reload-firewall() {
  ## Reference: https://stackoverflow.com/questions/54794217/opening-port-80-on-oracle-cloud-infrastructure-compute-node/54810101#54810101
  sudo iptables --flush
}

install-firewalld() {
  echo [WARN] firewalld will conflicts with docker interface and make ssh unavailable.
  sudo apt -y install firewalld
  sudo systemctl enable --now firewalld
  
}

$@
