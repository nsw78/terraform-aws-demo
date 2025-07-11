#!/bin/bash
set -e

cd environments/dev

terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -auto-approve -var-file=terraform.tfvars
