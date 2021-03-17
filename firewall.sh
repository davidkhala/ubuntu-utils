status(){
  sudo ufw status
}
enable(){
  sudo ufw enable
}
allowAll(){
  sudo ufw default allow incoming
}
disable(){
  sudo ufw disable
}
reload(){
  sudo ufw reload
}

$@
