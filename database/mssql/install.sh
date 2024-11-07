repos() {

  local isLegacy=$1
  if [[ "--isLegacy" == $isLegacy ]]; then
    # For Ubuntu versions < 24.04
    curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
  else
    # For Ubuntu versions >= 24.04
    curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

  fi

  # Add repo to apt sources
  curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

  sudo apt-get update
}
odbc() {
  repos $@
  # Install the driver
  sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
}
sqlcmd() {
  repos $@
  # optional: for bcp and sqlcmd
  sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
  echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bashrc
  source ~/.bashrc

}

$@
