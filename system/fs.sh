extend-partition() {
    echo "sudo growpart /dev/xvda 1"
}

extend-fs() {
    echo "sudo resize2fs /dev/xvda1"
}
install-cifs() {
    sudo apt-get install cifs-utils

}
mount-nas() {
    local username=$1
    local password=$2
    local remotePath=$3
    local localPath=$4
    sudo mount -t cifs -o username=$username,password=$password //$remotePath $localPath
}
$@
