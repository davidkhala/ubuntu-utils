user=${2:admin}
password=${3:password}
path=${4:/mnt/data}
install-server(){
  wget https://dl.min.io/server/minio/release/linux-amd64/minio_20221021223748.0.0_amd64.deb
  dpkg -i minio_20221021223748.0.0_amd64.deb
  rm minio_20221021223748.0.0_amd64.deb
  MINIO_ROOT_USER=$user MINIO_ROOT_PASSWORD=$password minio server $path --console-address ":9001"
}
install-client(){
  wget https://dl.min.io/client/mc/release/linux-amd64/mcli_20221020232633.0.0_amd64.deb
  dpkg -i mcli_20221020232633.0.0_amd64.deb
  rm mcli_20221020232633.0.0_amd64.deb
#   TODO
  mcli alias set myminio/ http://MINIO-SERVER MYUSER MYPASSWORD
}
$@
