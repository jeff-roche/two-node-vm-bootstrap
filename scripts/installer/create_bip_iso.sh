#!/bin/bash
set -xeuo pipefail

export OPENSHIFT_INSTALL_RELEASE_IMAGE_OVERRIDE="${RELEASE_IMAGE}"
${BIN_DIR}/openshift-install agent create image --log-level debug --dir="${INSTALLER_WORKDIR}"