curl -sSL https://packages.microsoft.com/keys/microsoft.asc -o microsoft.asc # merge lines
sudo apt-key add microsoft.asc
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"  | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt -y install code
