# This file is for you! Edit it to implement your own hooks (make targets) into
# the project as automated steps to be executed on locally and in the CD pipeline.

include ./scripts/init.mk
include ./scripts/test.mk

# ==============================================================================

example-build: # Build example project
	cd examples/react-app
	yarn install
	yarn build

example-upload: # Upload example files - mandatory: AWS_S3_BUCKET_NAME=[AWS S3 bucket name]
	cd examples/react-app
	aws s3 sync dist s3://$(AWS_S3_BUCKET_NAME)

# ==============================================================================

# Example CI/CD targets are: dependencies, build, publish, deploy, clean, etc.

dependencies: # Install dependencies needed to build and test the project
	# TODO: Implement installation of your project dependencies

build: # Build the project artefact
	# TODO: Implement the artefact build step

publish: # Publish the project artefact
	# TODO: Implement the artefact publishing step

deploy: # Deploy the project artefact to the target environment
	# TODO: Implement the artefact deployment step

clean:: # Clean-up project resources
	# TODO: Implement project resources clean-up step

config:: # Configure development environment
	# TODO: Use only `make` targets that are specific to this project, e.g. you may not need to install Node.js
	make \
		nodejs-install \
		python-install \
		terraform-install

# ==============================================================================

.SILENT: \
	build \
	clean \
	config \
	example-build \
	example-upload \
	dependencies \
	deploy \
