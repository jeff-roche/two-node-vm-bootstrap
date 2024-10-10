# Two Node Openshift VM Bootstrapper
Bootstrapping an Openshift 2-node cluster starting from SNO in VMs. 

This repo is a PoC and not to be considered production ready.

## Two Node Workflow
### 0. Prerequisites
- `jq` is needed for exporting the Pull Secret to setup the initial SNO cluster
- `oc` is needed in order to get and extract the installer image for the version of OCP you are targetting
- `PULL_SECRET` environment variable is required and should contain your registry pull secret
- `SSH_PUBLIC_KEY_FILE` environment variable is required and should contain the path to your ssh public key (ex: `~/.ssh/id_rsa.pub`)

### 1. Generate the Bootstrap in place ISO
```bash
$ make installer-setup # this will configure your working folder and download the OCP installer

$ make iso # This will copy any manifests, generate the install config and agent config, and then generate the bootstrap in place ISO
```