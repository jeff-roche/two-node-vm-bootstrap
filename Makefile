shell := /bin/bash
include .env

export BIN_DIR := $(WORKDIR)/bin
export INSTALLER_WORKDIR := $(WORKDIR)/$(CLUSTER_NAME)
export RELEASE_IMAGE ?= quay.io/openshift-release-dev/ocp-release:$(RELEASE_VERSION)-$(RELEASE_ARCH)

installer-setup:
	  @./scripts/installer/setup.sh

install-config.yaml:
		@./scripts/installer/install_config.sh

manifests:
		@./scripts/installer/manifests.sh

agent-config.yaml:
		@./scripts/installer/agent_config.sh

iso: install-config.yaml manifests agent-config.yaml
		@./scripts/installer/create_bip_iso.sh
	