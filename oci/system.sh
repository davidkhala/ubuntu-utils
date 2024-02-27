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
    # TODO is following required?
    iptables -F # Flush the selected chain (all the chains in the table if none is given). This is equivalent to deleting all the rules one by one.
    iptables -X # If no argument is given, it will attempt to delete every non-builtin chain in the table.
}
$@
 
