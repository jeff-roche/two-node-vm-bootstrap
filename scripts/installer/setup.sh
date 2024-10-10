#!/bin/bash
set -euxo pipefail

if [[ -z "${PULL_SECRET}"  ]]; then
  echo "ERROR: PULL_SECRET environment variable is undefined. Please provide a pull secret."
  exit 1
fi

# Create the needed folders
mkdir -p ${BIN_DIR}
mkdir -p ${INSTALLER_WORKDIR}

# Export the pull secret to be used by the installer
echo "Exporting PULL_SECRET"
jq -n -c "${PULL_SECRET}" > ${WORKDIR}/registry-config.json

# Get the installer
echo "Downloading the installer to ${BIN_DIR}"
oc adm release extract --registry-config=${WORKDIR}/registry-config.json --command=openshift-install --to ${BIN_DIR} ${RELEASE_IMAGE}