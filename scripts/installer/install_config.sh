#!/bin/bash
set -xeuo pipefail

SSH_KEY="$(cat ${SSH_PUBLIC_KEY_FILE})"

echo "Removing any previous configurations"
rm -rf ${INSTALLER_WORKDIR}/*

echo "Generating the install-config.yaml"
cat <<EOF > ${INSTALLER_WORKDIR}/install-config.yaml
apiVersion: v1
baseDomain: ${CLUSTER_BASE_DOMAIN}
compute:
- architecture: amd64
  hyperthreading: Enabled
  name: worker
  platform: {}
  replicas: 0
controlPlane:
  architecture: amd64
  hyperthreading: Enabled
  name: master
  platform: {}
  replicas: 1
metadata:
  creationTimestamp: null
  name: ${CLUSTER_NAME}
networking:
  clusterNetwork:
  - cidr: ${CLUSTER_NETWORK}
    hostPrefix: 23
  machineNetwork:
  - cidr: ${MACHINE_NETWORK}
  networkType: OVNKubernetes
  serviceNetwork:
  - ${CLUSTER_SVC_NETWORK}
platform:
  none: {}
BootstrapInPlace:
  InstallationDisk: ${INSTALLATION_DISK}
publish: External
pullSecret: |
        ${PULL_SECRET}
sshKey: |
        ${SSH_KEY}
EOF
