#!/bin/bash
set -xeuo pipefail

echo "Generating agent-config.yaml"
cat <<EOF > ${INSTALLER_WORKDIR}/agent-config.yaml
apiVersion: v1alpha1
kind: AgentConfig
metadata:
  name: sno-cluster
rendezvousIP: 192.168.126.10
EOF
