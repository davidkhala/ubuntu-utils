#!/usr/bin/env bash
get() {
	hostname
}
changeHostName() {
	local oldHostName=$(hostname)
	local newHostName=$1
	read -p " change hostname from \"${oldHostName}\" to \"${newHostName}\" ? (y/n)" choice
	case "$choice" in
	y | Y)
		sudo sed -i "/${oldHostName}/c ${newHostName}" /etc/hostname
		sudo sed -i "/127.0.1.1/c 127.0.1.1      ${newHostName}" /etc/hosts # NOTE /etc/hosts is required for some gnome program like 'chmod'
		echo success, system restart is required
		;;
	n | N)
		echo Abort...
		exit 1
		;;
	*)
		echo invalid input \"$choice\"
		exit 1
		;;
	esac

}
addHostMap() {
	local ip=$1
	local mapHostName=$2
	if grep "$mapHostName" /etc/hosts; then
		read -p " changing hostmap to \"${ip}\" ==> \"${mapHostName}\" ? (y/n)" choice
		case "$choice" in
		y | Y)
			sudo sed -i "/$mapHostName/c $ip      $mapHostName" /etc/hosts
			;;
		n | N)
			echo Abort...
			exit 1
			;;
		*)
			echo invalid input \"$choice\"
			exit 1
			;;
		esac
	else
		read -p " adding hostmap \"${ip}\" ==> \"${mapHostName}\" ? (y/n)" choice
		case "$choice" in
		y | Y)
			echo "$ip	$mapHostName" | sudo tee --append /etc/hosts
			;;
		n | N)
			echo Abort...
			exit 1
			;;
		*)
			echo invalid input \"$choice\"
			exit 1
			;;
		esac
	fi

}
hostIP() {
	# for docker container connect to docker host machine
	# run it in host terminal
	/sbin/ip route | awk '/default/ { print $3 }'
}
$@
