repos() {
  # For Ubuntu versions >= 24.04
  curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

  # Add repo to apt sources
  curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

  sudo apt-get update
}
odbc() {
  # Install the driver
  sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
}
sqlcmd() {
  # optional: for bcp and sqlcmd
  sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
  echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bashrc
  source ~/.bashrc

}

$@
