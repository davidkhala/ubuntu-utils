if ! xray --version; then
    wget https://s3.dualstack.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/aws-xray-daemon-3.x.deb
    sudo apt install ./aws-xray-daemon-3.x.deb
    rm aws-xray-daemon-3.x.deb
fi
