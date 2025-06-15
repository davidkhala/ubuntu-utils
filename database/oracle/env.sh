set -e

base=$(basename /opt/oracle/instantclient*)

sudo sh -c "echo /opt/oracle/${base} > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig
sudo ldconfig -p | grep oracle




