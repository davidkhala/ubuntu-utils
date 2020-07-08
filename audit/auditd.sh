set -e
install() {
  sudo apt-get install auditd audispd-plugins
  # audispd-plugins:These plugins can do things like relay events to remote machines or analyze events for suspicious behavior.
}
start() {

  # A boot param of audit=1 should be added to ensure that all processes that run before the audit daemon starts is marked as auditable by the kernel.
  # Not doing that will make a few processes impossible to properly audit.
  service auditd start
}

config=/etc/audit/auditd.conf # configuration file for audit daemon
rules=/etc/audit/audit.rules  # audit rules

auditDocker() {

  sudo auditctl -w /usr/bin/docker
  sudo auditctl -w /usr/bin/dockerd
  sudo auditctl -w /usr/bin/docker-init
  sudo auditctl -w /usr/bin/docker-proxy

}
terminateTTY(){
  local pid=$(ps -a | grep auditd | awk '{print $1}') # The pid for service 
  echo pid=$pid
  sudo kill -15 $pid
}
listRules() {
  sudo auditctl -l
}

$@
