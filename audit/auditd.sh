set -e

# Tutorial: how to understand log line: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/security_guide/sec-understanding_audit_log_files
install() {
  sudo apt-get install auditd audispd-plugins
  # audispd-plugins:These plugins can do things like relay events to remote machines or analyze events for suspicious behavior.
}
start() {

  # A boot param of audit=1 should be added to ensure that all processes that run before the audit daemon starts is marked as auditable by the kernel.
  # Not doing that will make a few processes impossible to properly audit.
  service auditd start
}

config=/etc/audit/auditd.conf    # configuration file for audit daemon
rules=/etc/audit/audit.rules     # audit rules
logPath=/var/log/audit/audit.log # default log path

foregroud() {
  # foregroud run will conflict with registered auditd service. You could have only single instance.
  sudo auditd -f

}
auditDocker() {

  sudo auditctl -w /usr/bin/docker
  sudo auditctl -w /usr/bin/dockerd
  sudo auditctl -w /usr/bin/docker-init
  sudo auditctl -w /usr/bin/docker-proxy
  sudo auditctl -w /var/run/docker.sock
  sudo auditctl -w /var/run/containerd/
  sudo auditctl -w /var/run/docker/

}
report() {
  # only one report can be specified usage
  # -a,--avc                        Avc report
  # -au,--auth                      Authentication report
  # --comm                          Commands run report
  # -c,--config                     Config change report
  # -cr,--crypto                    Crypto report
  # -e,--event                      Event report
  # -f,--file                       File name report

  # -h,--host                       Remote Host name report

  # --integrity                     Integrity event report
  # -l,--login                      Login report
  # -k,--key                        Key report
  # -m,--mods                       Modification to accounts report
  # -ma,--mac                       Mandatory Access Control (MAC) report
  # -n,--anomaly                    aNomaly report
  # -p,--pid                        Pid report
  # -r,--response                   Response to anomaly report
  # -s,--syscall                    Syscall report
  # -tm,--terminal                  TerMinal name report
  # --tty                           Report about tty keystrokes
  # -u,--user                       User name report
  # --virt                          Virtualization report
  # -x,--executable                 eXecutable name report

  sudo aureport --interpret $@
}
terminateTTY() {
  local pid=$(ps -a | grep auditd | awk '{print $1}') # The pid for service
  echo pid=$pid
  sudo kill -15 $pid
}
listRules() {
  sudo auditctl -l
}

$@
