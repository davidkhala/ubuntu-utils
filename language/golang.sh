remove(){
  sudo snap remove go
}
install(){
  sudo snap install go --classic
  export PATH="$PATH:$(go env GOPATH)/bin"
}
$@
