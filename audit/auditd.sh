install(){
  sudo apt-get install auditd audispd-plugins
  # what is audispd-plugins
}
start(){
  service auditd start ubuntu-utils/ audit/

}
$1
