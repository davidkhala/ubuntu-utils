set -e

# Tutorial: how to understand log line: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/security_guide/sec-understanding_audit_log_files
install() {
  sudo apt-get install auditd audispd-plugins
  # audispd-plugins:These plugins can do things like relay events to remote machines or analyze events for suspicious behavior.
}

config=/etc/audit/auditd.conf    # configuration file for audit daemon
rules=/etc/audit/audit.rules     # audit rules
logPath=/var/log/audit/audit.log # default log path


auditDocker() {

  sudo auditctl -w /usr/bin/docker
  sudo auditctl -w /usr/bin/dockerd
  sudo auditctl -w /usr/bin/docker-init
  sudo auditctl -w /usr/bin/docker-proxy
  sudo auditctl -w /var/run/docker.sock
  sudo auditctl -w /var/run/containerd/
  sudo auditctl -w /var/run/docker/

}


$@
