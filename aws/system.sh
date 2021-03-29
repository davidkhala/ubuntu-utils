## Reference: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html
extendFileSystem() {
    # sudo growpart /dev/xvda 1
    sudo resize2fs /dev/nvme0n1p1
}
$@
 
