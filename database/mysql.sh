#!/usr/bin/env bash
set -e
install() {
	if ! mysql --version; then
		sudo apt install mysql-server -y
	fi
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
	sleep 10
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
	sudo mysql -h 127.0.0.1 -u root ${passwordOpt} -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$1'"
	sudo systemctl restart mysql
}
connectionPoolSize() {
	sudo mysql -u root -p -e 'SHOW VARIABLES LIKE "max_connections"'
}
$@
