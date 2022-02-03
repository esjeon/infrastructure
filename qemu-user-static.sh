#!/bin/sh
# Register static QEMU to binfmt_misc to run emulate other architectures.
#
# See https://github.com/multiarch/qemu-user-static
set -euf

sudo podman run --rm --privileged multiarch/qemu-user-static --reset -p yes
