install(){
  sudo apt-get install auditd audispd-plugins
  # what is audispd-plugins
}
start(){
  service auditd start

}
$1
