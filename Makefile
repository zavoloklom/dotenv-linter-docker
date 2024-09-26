.DEFAULT_GOAL := help
.PHONY: help alpine busybox dev-alpine dev-busybox

%:
	@true

help: ## This help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######
# CONFIGURATION
######

# Variables
DOTENV_LINTER_VERSION=$(shell cat VERSION)
IMAGE_NAME=zavoloklom/dotenv-linter
IMAGE_TAG=dev
BUILD_DATE="$(shell date +%Y-%m-%dT%T%z)"
BUILD_REVISION="$(shell git rev-parse --short HEAD)"

######
# LINT SCRIPTS
######

init: ## Set up git hooks with lefthook.
	-lefthook install

lint: ## Run linters.
	-lefthook run lint

fix: ## Run fixes where possible.
	-lefthook run fix

######
# MAIN SCRIPTS
######

alpine: ## Build alpine-version docker image.
	docker build --file Dockerfile . --tag ${IMAGE_NAME}:alpine-${IMAGE_TAG} \
      --target=alpine-version \
	  --pull \
	  --build-arg DOTENV_LINTER_VERSION=${DOTENV_LINTER_VERSION} \
	  --build-arg BUILD_DATE=${BUILD_DATE} \
	  --build-arg BUILD_REVISION=${BUILD_REVISION}

busybox: ## Build busybox-version docker image.
	docker build --file Dockerfile . --tag ${IMAGE_NAME}:busybox-${IMAGE_TAG} \
      --target=busybox-version \
	  --pull \
	  --build-arg DOTENV_LINTER_VERSION=${DOTENV_LINTER_VERSION} \
	  --build-arg BUILD_DATE=${BUILD_DATE} \
	  --build-arg BUILD_REVISION=${BUILD_REVISION}

dev-alpine: alpine ## Start alpine container. Note: all files are synced.
	docker run --rm -it --entrypoint="/bin/sh" -v ${PWD}:/app ${IMAGE_NAME}:alpine-${IMAGE_TAG}

dev-busybox: busybox ## Start alpine container. Note: all files are synced.
	docker run --rm -it --entrypoint="/bin/sh" -v ${PWD}:/app ${IMAGE_NAME}:busybox-${IMAGE_TAG}
