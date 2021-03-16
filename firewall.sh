status(){
  sudo ufw status
}
enable(){
  sudo ufw enable
}
allowAll(){
  sudo ufw allow from 0.0.0.0/0
}
disable(){
  sudo ufw disable
}
reload(){
  sudo ufw reload
}

$@
