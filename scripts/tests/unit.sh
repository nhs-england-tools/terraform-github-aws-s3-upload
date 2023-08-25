#!/bin/bash

set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

AWS_S3_BUCKET_NAME_EXAMPLE=nhs-england-tools-terraform-github-aws-s3-upload-example

# set up
if [ "$action" == "infrastructure-set-up" ]; then
  make terraform-init
  make terraform-plan opts="-out=terraform.tfplan"
  make terraform-apply opts="-auto-approve terraform.tfplan"
fi

# upload
if [ "$action" == "file-upload" ]; then
  aws s3 cp README.md s3://${AWS_S3_BUCKET_NAME_EXAMPLE}/README.md
fi

# tear down
if [ "$action" == "infrastructure-tear-down" ]; then
  make terraform-destroy opts="-auto-approve"
fi
