set -e -x
extendDisk() {
    #   Rescan 
    sudo dd iflag=direct if=/dev/oracleoci/oraclevda of=/dev/null count=1
    echo "1" | sudo tee /sys/class/block/`readlink /dev/oracleoci/oraclevda | cut -d'/' -f 2`/device/rescan
    #   Extend the partition
    set +e
    curl https://raw.githubusercontent.com/oracle/oci-utils/master/libexec/oci-growfs | sudo bash
    set -e
    
    sudo resize2fs /dev/sda1
}
viewDisk(){
    df -hT
    lsblk
}
$@
 
