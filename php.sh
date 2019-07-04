#!/usr/bin/env bash
install() {
    sudo apt install -y php
}
installApacheInterpretor() {
    # https://stackoverflow.com/questions/2712825/what-is-mod-php
    sudo apt install libapache2-mod-php
}
installMySQLConnector() {
    sudo apt install php-mysql
}

installImageLib() {
    # php image processor
    sudo apt install php-gd
}
installLangLib() {
    # mbstring provides multibyte specific string functions that help you deal with multibyte encodings in PHP. [multi-language-support]
    sudo apt install php-mbstring

}
installZipLib() {
    # Zip module for PHP.
    sudo apt install php-zip
}
installXMLLib() {
    # A php library for building xml-rpc clients and servers.
    sudo apt install php-xmlrpc

    # DOM, SimpleXML, WDDX, XML, and XSL module for PHP
    sudo apt install php-xml
}
installDevPack() {
    # PEAR: PHP Extension and Application Repository: php package manager
    sudo apt install php-pear

    # cUrl in php: http reqesut library https://stackoverflow.com/questions/3062324/what-is-curl-in-php
    sudo apt install php-curl

    # PHP FastCGI Process Manager (PHP-FPM)
    sudo apt install php-fpm

    # Headers and other PHP needed for compiling additional modules.
    sudo apt install php-dev

    installApacheInterpretor
    installMySQLConnector
    installImageLib
    installLangLib
}
check() {
    php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'
}
$1
