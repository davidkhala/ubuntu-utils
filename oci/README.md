# Known issue
- NFS network issue
- opening port. There are 3 things you need to set when opening a port.
  - Ingress / Egress rules
  - Routing
  - firewall on the server:
    - `curl https://github.com/davidkhala/ubuntu-utils/blob/master/oci/system.sh | bash -s open-port`
