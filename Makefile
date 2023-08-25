# This file is for you! Edit it to implement your own hooks (make targets) into
# the project as automated steps to be executed on locally and in the CD pipeline.

include ./scripts/init.mk

# ==============================================================================

TERRAFORM_STACK=examples

clean:: # Clean-up project resources
	rm -f examples/.terraform.lock.hcl

config:: # Configure development environment
	make terraform-install

# ==============================================================================

.SILENT: \
	clean \
	config \
