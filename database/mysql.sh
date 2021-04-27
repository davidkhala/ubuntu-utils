#!/usr/bin/env bash
set -e
install() {
	if ! mysql --version; then
		sudo apt-get install mysql-server -y
		if [[ "$1" == "secure" ]]; then
			sudo mysql_secure_installation utility
		fi

	fi
}
purge() {
	set +e
	sudo systemctl stop mysql
	set -e
	sudo apt purge -y mysql-server mysql-client mysql-common
	sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql

	sudo apt-get -y autoremove
	sudo apt-get autoclean
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

	sudo mysql -u root ${passwordOpt} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$1'"
	sudo systemctl restart mysql
}
connectionPoolSize() {
	sudo mysql -u root -p -e 'SHOW VARIABLES LIKE "max_connections"'
}
$@
