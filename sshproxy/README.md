sshproxy
========

SSH daemon configured to be used as SOCKS proxy server.

Build
-----

    make build-image


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

    docker run -d -v /path/to/config:/config -p ${SSH_PORT}:22 sshproxy


### Client

    ssh -i path/to/identity -p ${SSH_PORT} -N -D ${SOCKS_PORT} root@server.host.name


