#!/bin/bash
set -e

sudo apt install -y alien
SQLDeveloper() {
    wget https://download.oracle.com/otn_software/java/sqldeveloper/sqldeveloper-24.3.1-347.1826.noarch.rpm
    sudo alien -i --scripts sqldeveloper-*.rpm
    rm sqldeveloper-*.rpm

}
SQLPlus() {
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-sqlplus-linuxx64.rpm
    sudo alien -i --scripts oracle-instantclient-sqlplus*.rpm
    rm oracle-instantclient-sqlplus*.rpm
}

instant-client-lite() {
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basiclite-linuxx64.rpm
    sudo alien -i --scripts oracle-instantclient-basic*.rpm
    rm oracle-instantclient-basic*.rpm
}

$@
