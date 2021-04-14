#!/usr/bin/env bash
set -e -x
install() {
	if ! mysql --version; then
		sudo apt install mysql-server -y
		if [[ "$1" != 'insecure' ]]; then
			sudo mysql_secure_installation utility
		fi

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

	sudo mysql -h 127.0.0.1 -u root ${passwordOpt} -e "UPDATE mysql.user SET authentication_string = PASSWORD('$1') WHERE User = 'root';" ## FIXME remove -h
	sudo systemctl restart mysql
}
connectionPoolSize() {
	sudo mysql -u root -p -e 'SHOW VARIABLES LIKE "max_connections"'
}
$@
