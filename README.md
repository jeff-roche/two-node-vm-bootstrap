# Two Node Openshift VM Bootstrapper
Bootstrapping an Openshift 2-node cluster starting from SNO in VMs. 

This repo is a PoC and not to be considered production ready.

## Two Node Workflow
### Prerequisites
- `jq` is needed for exporting the Pull Secret to setup the initial SNO cluster
- `oc` is needed in order to get and extract the installer image for the version of OCP you are targetting