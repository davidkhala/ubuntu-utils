set -e
# for `mc` CLI install, see https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/apps/minio.sh
install-server() {
  wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio_20250524170830.0.0_amd64.deb -O minio.deb
  sudo dpkg -i minio.deb
  rm minio.deb
  local user=${1:-admin}
  local password=${2:-password}
  local path=${3:-/mnt/data}
  MINIO_ROOT_USER=$user MINIO_ROOT_PASSWORD=$password minio server $path --console-address ":9001" &
}

$@
