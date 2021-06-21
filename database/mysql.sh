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
	curl -s https://raw.githubusercontent.com/davidkhala/mysql-toolset/main/mysql.sh | bash -s setRootPassword $1 $2
}
connectionPoolSize() {
	curl https://raw.githubusercontent.com/davidkhala/mysql-toolset/main/mysql.sh | bash -s connectionPoolSize
	
}
$@
