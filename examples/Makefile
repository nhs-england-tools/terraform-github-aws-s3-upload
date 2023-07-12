terraform-init: # Initialize Terraform
	terraform init

terraform-plan: # Plan Terraform
	terraform plan -out=terraform.tfplan

terraform-apply: # Apply Terraform
	terraform apply -auto-approve "terraform.tfplan"

terraform-destroy: # Destroy artefacts created by Terraform
	terraform destroy -auto-approve

.SILENT: \
	terraform-apply \
	terraform-destroy \
	terraform-init \
	terraform-plan
