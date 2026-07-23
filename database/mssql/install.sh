repos() {
	local VERSION_ID=$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2)

	if ! [[ "18.04 20.04 22.04 24.04 25.10" == *"$VERSION_ID"* ]]; then
		echo "Ubuntu $VERSION_ID is not currently supported."
		exit 1
	fi

	# Download the package to configure the Microsoft repo
	curl -sSL -O https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
	sudo dpkg -i packages-microsoft-prod.deb
	rm packages-microsoft-prod.deb

	sudo apt-get update
}

odbc() {
	local version=${1:-18}

	repos

	case "$version" in
	18)
		sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
		;;
	17)
		sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
		;;
	*)
		echo "Unsupported ODBC version: $version."
		exit 1
		;;
	esac
	# optional: for unixODBC development headers
	sudo apt-get install -y unixodbc-dev
}

sqlcmd() {
	repos
	local version=${1:-18}

	case "$version" in
	18)
		sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
		echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bashrc
		;;
	17)
		sudo ACCEPT_EULA=Y apt-get install -y mssql-tools
		echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >>~/.bashrc
		;;
	*)
		echo "Unsupported ODBC version: $version."
		exit 1
		;;
	esac

	source ~/.bashrc
}

$@
