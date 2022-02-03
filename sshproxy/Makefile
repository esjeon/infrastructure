
IMAGE=sshproxy
TAG=4
REPO=docker://esjeon/sshproxy

.PHONY: help
help:
	@grep ':[^.]*##' $(lastword $(MAKEFILE_LIST)) | sed 's/:.*##\s*/:\n\t/'

.PHONY: clean
clean: clean-hostkey ## Clean

.PHONY: build
build: ## Build the container for development.
	buildah build --layers --tag $(IMAGE):dev .

.PHONY: build-prod
build-prod: ## Build a multi-arch image for production.
	buildah build --arch=amd64 --layers --tag $(IMAGE):$(TAG)-amd64 .
	buildah build --arch=arm64 --layers --tag $(IMAGE):$(TAG)-arm64 .
	
	buildah rmi $(IMAGE):$(TAG) || true
	buildah manifest rm $(IMAGE):$(TAG) || true
	buildah manifest create $(IMAGE):$(TAG)
	buildah manifest add $(IMAGE):$(TAG) $(IMAGE):$(TAG)-amd64
	buildah manifest add $(IMAGE):$(TAG) $(IMAGE):$(TAG)-arm64

.PHONY: push-prod
push-prod: ## push the prod image to DockerHub.
	buildah manifest push --all $(IMAGE):$(TAG) $(REPO):$(TAG)

.PHONY: clean-hostkey
clean-hostkey: ## Remove generated host keys.
	rm -vf ssh_host_*_key ssh_host_*_key.pub

.PHONY: generate-hostkey
generate-hostkey: ssh_host_rsa_key     
generate-hostkey: ssh_host_ecdsa_key   
generate-hostkey: ssh_host_ed25519_key 
generate-hostkey: ## Generate a new set of host keys.

ssh_host_%_key:
	ssh-keygen -q -f $@ -N '' -t $*
	chmod -v 600 $@
