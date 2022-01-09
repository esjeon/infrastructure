sshproxy
========

SSH daemon configured to be used as VPN server.


Configuration
-------------

The image expects `/config` directory to contain following files:

 * `authorized_keys`
 * SSH host keys
   - One of `ssh_host_rsa_key`, `ssh_host_ecdsa_key`, `ssh_host_ed25519_key`

The host key files can be generated using `generate-host-keys.sh`.


Deployment
----------

	docker run -d -v /path/to/config:/config -p 1234:22 sshproxy


Usage
-----

Example:

	ssh -N -D1234 root@example.com

You must login to `root` account using public key authentication. Note that
shell access is denied, so you must append `-N` flag to keep the session alive.

