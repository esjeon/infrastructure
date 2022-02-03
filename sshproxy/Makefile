
SECRET_NAME=sshproxy-hostkey
IMAGE_NAME=docker.io/esjeon/sshproxy

.PHONY: help
help:
	@grep ':[^.]*##' $(lastword $(MAKEFILE_LIST)) | sed 's/:.*##\s*/:\n\t/'

.PHONY: clean
clean: clean-hostkey ## Clean

.PHONY: build-image
build-image: ## Build container image
	buildah build --layers --tag $(IMAGE_NAME):latest .

.PHONY: clean-hostkey
clean-hostkey: ## Remove generated host keys
	rm -vf ssh_host_*_key ssh_host_*_key.pub

.PHONY: generate-hostkey
generate-hostkey: ssh_host_rsa_key     
generate-hostkey: ssh_host_ecdsa_key   
generate-hostkey: ssh_host_ed25519_key 
generate-hostkey: ## Generate a new set of host keys

ssh_host_%_key:
	ssh-keygen -q -f $@ -N '' -t $*
	chmod -v 600 $@
