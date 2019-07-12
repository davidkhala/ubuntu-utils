#!/usr/bin/env bash
set -e
install() {
    sudo apt install -y php
}
installApacheInterpretor() {
    # https://stackoverflow.com/questions/2712825/what-is-mod-php
    sudo apt install -y libapache2-mod-php
}
installMySQLConnector() {
    sudo apt install -y php-mysql
}

installImageLib() {
    # php image processor
    sudo apt install -y php-gd
}
installLangLib() {
    # mbstring provides multibyte specific string functions that help you deal with multibyte encodings in PHP. [multi-language-support]
    sudo apt install -y php-mbstring
}
installZipLib() {
    # Zip module for PHP.
    sudo apt install php-zip
}
installXMLLib() {
    # A php library for building xml-rpc clients and servers.
    sudo apt install php-xmlrpc
}
installDevPack() {
    # PEAR: PHP Extension and Application Repository: php package manager [php-xml included]
    sudo apt install -y php-pear

    # cUrl in php: http reqesut library https://stackoverflow.com/questions/3062324/what-is-curl-in-php
    sudo apt install -y php-curl

    # PHP FastCGI Process Manager (PHP-FPM)
    sudo apt install -y php-fpm
}
installBuildHead() {
    # Headers and other PHP needed for compiling additional modules.
    sudo apt install php-dev
}
check() {
    php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'
}
installComposer() {
    wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet
    sudo mv composer.phar /usr/local/bin/composer
}
$1
