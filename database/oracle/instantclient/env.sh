set -e

base=$(basename /opt/oracle/instantclient*)
if [ -z "$LD_LIBRARY_PATH" ]; then
  export LD_LIBRARY_PATH=/opt/oracle/${base}
else
  export LD_LIBRARY_PATH=/opt/oracle/${base}:$LD_LIBRARY_PATH
fi


# sudo sh -c "echo /opt/oracle/${base} > /etc/ld.so.conf.d/oracle-instantclient.conf"
# sudo ldconfig

echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"
