#!/bin/bash
set -e

sudo apt install -y alien
SQLDeveloper(){
    wget https://objectstorage.ap-seoul-1.oraclecloud.com/n/cn9yc2hk0gzg/b/Oracle-Database-Development/o/sqldeveloper-20.4.0.379.2205-20.4.0-379.2205.noarch.rpm
    sudo alien -i --scripts sqldeveloper-*.rpm 
    rm sqldeveloper-*.rpm

}
SQLPlus(){
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-sqlplus-linuxx64.rpm
    sudo alien -i --scripts oracle-instantclient-sqlplus*.rpm 
    rm oracle-instantclient-sqlplus*.rpm
}

instant-client-lite(){
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basiclite-linuxx64.rpm
    sudo alien -i --scripts oracle-instantclient-basic*.rpm 
    rm oracle-instantclient-basic*.rpm
}

$@
