set -e
# Ubuntu includes PostgreSQL by default.
register() {
    # Only if the version included in your version of Ubuntu is not the one you want
    sudo apt install -y postgresql-common
    sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
}
install() {
    sudo apt install -y postgresql
}
install-client() {
    sudo apt install -y postgresql-client
}
$@
