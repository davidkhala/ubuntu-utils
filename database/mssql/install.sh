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
  repos
  # Install the driver
  sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
  # optional: for unixODBC development headers
  sudo apt-get install -y unixodbc-dev
}

sqlcmd() {
  repos
  # optional: for bcp and sqlcmd
  sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
  echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
  source ~/.bashrc
}

$@
