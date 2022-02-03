sshproxy
========

SSH daemon configured to be used as SOCKS proxy server.

Build
-----

    make build      # Build dev image
    make build-prod # Build prod multi-arch image
    make push-prod  # Upload the multi-arch image to the repository

To build multi-arch images, you'll need to register `qemu-user-static` to
`binfmt_misc`.

Configuration
-------------

Place thesefiles under `/config`:

    authorized_keys

    ssh_host_rsa_key
    ssh_host_ecdsa_key
    ssh_host_ed25519_key

The host key files can be generated using `make generate-hostkey`.


Deployment
----------

### Server

    podman run -d -v /path/to/config:/config:Z -p ${SSH_PORT}:22 sshproxy


### Client

    ssh -i path/to/identity -p ${SSH_PORT} -N -D ${SOCKS_PORT} root@server.host.name


