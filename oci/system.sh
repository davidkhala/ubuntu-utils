set -e
extend-disk() {
    #   Rescan 
    sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
    echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan
    #   Extend the partition
    sudo growpart /dev/sda 1
    sudo resize2fs /dev/sda1
}
view-disk(){
    df -hT
    lsblk
}
open-port(){
    iptables -P INPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -F
    iptables -X
}
$@
 
