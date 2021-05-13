set -e
extendDisk() {
    sudo growpart /dev/sda1 1
    sudo resize2fs /dev/sda1
}
viewDisk(){
    df -hT
    lsblk
}
$@
 
