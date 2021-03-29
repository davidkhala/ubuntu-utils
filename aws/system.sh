## Reference: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html
set -e
extendFileSystem() {
    sudo growpart /dev/nvme0n1 1
    sudo resize2fs /dev/nvme0n1p1
}
$@
 
