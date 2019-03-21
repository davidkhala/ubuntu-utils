#!/usr/bin/env bash
install() {
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt update
    sudo apt install certbot
}
prepare() {
    certbot certonly --manual
}
usage() {
    echo "For nodejs server: https://itnext.io/node-express-letsencrypt-generate-a-free-ssl-certificate-and-run-an-https-server-in-5-minutes-a730fbe528ca"

}
