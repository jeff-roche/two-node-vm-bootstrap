#!/bin/bash
set -xeuo pipefail

# Copy any custom manifests
if [[ -z ${CUSTOM_MANIFEST_DIR} ]]; then
  echo "Copying custom manifests"
  mkdir -p ${INSTALLER_WORKDIR}/openshift
  cp -v ${CUSTOM_MANIFEST_DIR}/*.yaml ${INSTALLER_WORKDIR}/openshift/ || true
  cp -v ${CUSTOM_MANIFEST_DIR}/*.yml ${INSTALLER_WORKDIR}/openshift/ || true
fi