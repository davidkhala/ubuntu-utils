set -e
extend-disk() {
    #   Rescan 
    sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
    echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan
    #   Extend the partition
    sudo growpart /dev/sda 1
    sudo resize2fs /dev/sda1
}
view-disk() {
    df -hT
    lsblk
}
open-port() {
    sudo iptables -P INPUT ACCEPT
    sudo iptables -P FORWARD ACCEPT
    sudo iptables -P OUTPUT ACCEPT
    
    sudo iptables -F # Flush the selected chain (all the chains in the table if none is given). This is equivalent to deleting all the rules one by one.
    sudo sh -c '/sbin/iptables-save > /etc/iptables/rules.v4' # https://www.cyberciti.biz/faq/how-to-save-iptables-firewall-rules-permanently-on-linux/

}
$@
 
