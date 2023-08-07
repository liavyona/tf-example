#!/bin/bash

# Get fireflyci
curl -O <https://gofirefly-prod-iac-ci-cli-binaries.s3.amazonaws.com/fireflyci/v0.0.16/fireflyci_Linux_x86_64.tar.gz
tar -xf fireflyci_Linux_x86_64.tar.gz
chmod a+x fireflyci

# Initialize Terraform
terraform init

# Run Terraform plan and save the output to plan.json
terraform plan -out=plan.json

./fireflyci scan -f plan.json --config-file config.yaml --timeout 180

# Apply the Terraform changes using the plan file
terraform apply plan.json
