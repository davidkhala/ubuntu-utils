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

install-shell(){
  wget https://repo.mysql.com/mysql-apt-config_0.8.18-1_all.deb
  sudo apt-get install ./mysql-apt-config_0.8.18-1_all.deb
  rm mysql-apt-config_0.8.18-1_all.deb
  sudo apt-get update
  sudo apt-get install -y mysql-shell

}

install-router() {
	sudo apt install -y mysql-router-community
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
install-workbench() {
	sudo apt install mysql-workbench
}
start() {
	sudo systemctl enable --now mysql
}
setup() {
	install
	start
}
set-root-password() {
	curl -s https://raw.githubusercontent.com/davidkhala/mysql-toolset/main/mysql.sh | bash -s set-root-password $1 $2
}
connection-pool-size() {
	curl https://raw.githubusercontent.com/davidkhala/mysql-toolset/main/mysql.sh | bash -s connection-pool-size
	
}
$@
