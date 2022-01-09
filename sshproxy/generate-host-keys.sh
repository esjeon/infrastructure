#!/bin/bash
# Generate host keys for SSH server

# These filenames are the default values from OpenSSH
ssh-keygen -q -f ssh_host_rsa_key     -N '' -t rsa
ssh-keygen -q -f ssh_host_ecdsa_key   -N '' -t ecdsa
ssh-keygen -q -f ssh_host_ed25519_key -N '' -t ed25519

chmod 600 \
  ssh_host_rsa_key \
  ssh_host_ecdsa_key \
  ssh_host_ed25519_key
