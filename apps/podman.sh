set -e
install-desktop(){
  flatpak install --user flathub io.podman_desktop.PodmanDesktop

}
$@
