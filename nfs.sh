#!/usr/bin/env bash

# setting="nfs defaults 0 0"
setting="nfs rsize=8192,wsize=8192,timeo=14,intr,user" # https://askubuntu.com/questions/546176/nfs-partition-not-mounted-automatically-at-boot-time-anymore
fstab="/etc/fstab"
hostExports="/etc/exports"
mountClient() {
	local localDIR=$1
	local nfsIP=$2
	local nfsDIR=$3
	if grep "$nfsIP:$nfsDIR" $fstab; then
		read -p " found $nfsIP:$nfsDIR on $fstab , Do you want to replace with <$nfsIP:$nfsDIR $localDIR $setting>? (y/n)" choice
		case "$choice" in
		y | Y) sed -i "\|${localDIR}|c $nfsIP:$nfsDIR $localDIR $setting" $fstab ;;
		n | N)
			echo Abort...
			exit 0
			;;
		*)
			echo invalid input \"$choice\"
			exit 1
			;;
		esac
	else
		echo "$nfsIP:$nfsDIR $localDIR $setting" | sudo tee --append $fstab
	fi
}
rmMountedClient() {
	local localDIR=$1
	read -p " Continue with sed pattern \"${localDIR}\" on $fstab ? (y/n)" choice
	case "$choice" in
	y | Y) sed -i "/${localDIR}/d" $fstab ;;
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
updateMountedClient() {
	rmMountedClient $remain_params
	mountClient $remain_params
}
installHost() {
	sudo apt install -y nfs-kernel-server
}
installClient() {
	sudo apt install -y nfs-common
}
exposeHost() {
	local localDIR=$1
	if ! grep $localDIR $hostExports; then
		echo "$localDIR	*(ro,sync,no_root_squash)" | sudo tee -a $hostExports
	fi
}
rmExposedHost() {
	local localDIR=$1
	read -p " Continue with sed pattern \"${localDIR}\" on $hostExports ? (y/n)" choice
	case "$choice" in
	y | Y) sed -i "/${localDIR}/d" $hostExports ;;
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
startHost() {
	#	systemctl start nfs-kernel-server.service?
	/etc/init.d/nfs-kernel-server restart
}
$@
