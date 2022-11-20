#!/usr/bin/env bash
install-netstat() {
  sudo apt install net-tools
}
reset-firewall() {
  ## Reference: https://stackoverflow.com/questions/54794217/opening-port-80-on-oracle-cloud-infrastructure-compute-node/54810101#54810101
  sudo iptables --flush

}
install-firewalld() {
  echo [WARN] firewalld will conflicts with docker interface and make ssh unavailable.
  sudo apt -y install firewalld
  sudo firewall-cmd --permanent --add-port=22/tcp
  sudo firewall-cmd --reload
}

$@
