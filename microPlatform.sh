#!/bin/bash

# Gateway target hostname
hostname=${GW_HOSTNAME:-10.0.1.3}
gatewayuser=linaro
gatewayuserpass=linaro

#First argument Ansible tags
target=${1:-gateway}

ansible-playbook -u $gatewayuser -i $hostname, microPlatform.yml \
    --extra-vars "ansible_become_pass=$gatewayuserpass" \
    --tags $target
