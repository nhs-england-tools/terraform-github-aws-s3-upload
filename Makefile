include ./scripts/init.mk

example-build: # Build example project
	cd examples/react-app
	yarn install
	yarn build

example-upload: # Upload example files - mandatory: AWS_S3_BUCKET_NAME=[AWS S3 bucket name]
	cd examples/react-app
	aws s3 sync dist s3://$(AWS_S3_BUCKET_NAME)

config: # Configure development environment
	make githooks-install
	make \
		nodejs-install \
		terraform-install \
	||:

.SILENT: \
	config \
	githooks-install
