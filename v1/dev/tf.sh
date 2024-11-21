#!/bin/bash

apply () {
    cd vpc
    terraform init
    terraform apply --auto-approve
    cd ../subnet
    terraform init
    terraform apply --auto-approve
}

destroy () {
    cd subnet
    terraform destroy
    cd ../vpc
    terraform destroy
}

case "$1" in
    "apply") apply
    ;;
    "destroy") destroy
    ;;
esac