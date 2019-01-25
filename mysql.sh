remain_params=""
for ((i = 2; i <= $#; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
function install() {
	sudo apt install mysql-server
}
function start() {
	systemctl start mysql
}
function setRootPassword() {
    echo "targeted new password [$1]"
	mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$1'"
}
$1 $remain_params
