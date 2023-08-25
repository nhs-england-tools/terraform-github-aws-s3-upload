# This file is for you! Edit it to implement your own Docker make targets.

# ==============================================================================
# Custom implementation - implementation of a make target should not exceed 5 lines of effective code.
# In most cases there should be no need to modify the existing make targets.

# Your default 'DOCKER_IMAGE' and 'DOCKER_TITLE' are passed to the functions as environment variables
DOCKER_IMAGE := $(or $(or $(DOCKER_IMAGE), $(IMAGE)), ghcr.io/org/repo)
DOCKER_TITLE := $(or $(or $(DOCKER_TITLE), $(TITLE)), My Docker image)

docker-build: # Build Docker image - optional: dir=[path to the Dockerfile to use, default is '.']
	source ./scripts/docker/docker.lib.sh
	docker-build # 'dir' is passed to the function as environment variables, if set

clean:: # Remove Docker resources - optional: dir=[path to the image directory where the Dockerfile is located, default is '.']
	source ./scripts/docker/docker.lib.sh
	docker-clean # 'dir' is passed to the function as environment variables, if set

# ==============================================================================
# Quality checks - please, DO NOT edit this section!

docker-shellscript-lint: # Lint all Docker module shell scripts
	for file in $$(find ./scripts/docker -type f -name "*.sh"); do
		file=$$file ./scripts/shellscript-linter.sh
	done

# ==============================================================================
# Module tests and examples - please, DO NOT edit this section!

docker-test-suite-run: # Run Docker test suite
	./scripts/docker/tests/docker.test.sh

docker-example-build: # Build Docker example
	source ./scripts/docker/docker.lib.sh
	cd ./scripts/docker/examples/python
	DOCKER_IMAGE=repository-template/docker-example-python
	DOCKER_TITLE="Repository Template Docker Python Example"
	docker-build

docker-example-lint: # Lint Docker example
	dockerfile=./scripts/docker/examples/python/Dockerfile
	file=$$dockerfile ./scripts/docker/dockerfile-linter.sh

docker-example-run: # Run Docker example
	source ./scripts/docker/docker.lib.sh
	cd ./scripts/docker/examples/python
	DOCKER_IMAGE=repository-template/docker-example-python
	args=" \
		-it \
		--publish 8000:8000 \
	"
	docker-run

# ==============================================================================

.SILENT: \
	clean \
	docker-build \
	docker-example-build \
	docker-example-lint \
	docker-example-run \
	docker-shellscript-lint \
	docker-test-suite-run \
