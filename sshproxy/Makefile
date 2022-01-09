
SECRET_NAME=sshproxy-hostkey
IMAGE_NAME=docker.io/esjeon/sshproxy

.PHONY: all
all: build-image

.PHONY: build-image
build-image:
	buildah build --layers --tag $(IMAGE_NAME):latest .

.PHONY: clean
clean: clean-hostkey

.PHONY: clean-hostkey
clean-hostkey:
	rm -vf ssh_host_*_key ssh_host_*_key.pub

.PHONY: gcp-create-secret
gcp-create-secret:
	gcloud services enable secretmanager.googleapis.com
	gcloud secrets create $(SECRET_NAME)

.PHONY: gcp-renew-secret
gcp-renew-secret:
	make generate-hostkey
	tar cv ssh_host_*_key* | gcloud secrets versions add $(SECRET_NAME) --data-file=-
	make clean-hostkey

.PHONY: generate-hostkey
generate-hostkey: ssh_host_rsa_key     
generate-hostkey: ssh_host_ecdsa_key   
generate-hostkey: ssh_host_ed25519_key 


ssh_host_%_key:
	ssh-keygen -q -f $@ -N '' -t $*
	chmod -v 600 $@
