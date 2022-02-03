#!/bin/bash
set -euf -o pipefail

cp -v /config/ssh_host_rsa_key     /root/ssh_host_rsa_key
cp -v /config/ssh_host_ecdsa_key   /root/ssh_host_ecdsa_key
cp -v /config/ssh_host_ed25519_key /root/ssh_host_ed25519_key

chmod -v 600 /root/ssh_host_rsa_key
chmod -v 600 /root/ssh_host_ecdsa_key
chmod -v 600 /root/ssh_host_ed25519_key

exec /usr/sbin/sshd -D
