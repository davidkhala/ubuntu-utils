#!/usr/bin/env bash
set -e -x
install() {
	if ! mysql --version; then
		sudo apt-get install mysql-server -y
		if [[ "$1" != "insecure" ]]; then
			sudo mysql_secure_installation utility
		fi

	fi
}
purge() {
	sudo apt-get --purge -y remove mysql-server mysql-common mysql-client
	sudo apt -y autoremove
}
installWorkBench() {
	sudo apt install mysql-workbench
}
start() {
	sudo systemctl start mysql
}
setup() {
	install
	start
}
setRootPassword() {
	echo "targeted new password [$1]"
	local passwordOpt="-p"

	if [[ -n "$2" ]]; then
		if [[ "$2" == "--init" ]]; then
			passwordOpt=""
		else
			passwordOpt="--password=$2"
		fi
	fi

	sudo mysql -h localhost -u root ${passwordOpt} -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$1'"
	sudo systemctl restart mysql
}
connectionPoolSize() {
	sudo mysql -u root -p -e 'SHOW VARIABLES LIKE "max_connections"'
}
$@
