-include .env
SHELL := /bin/bash
PROJECT_NAME?=nestjs

USER_ID:=$(shell id -u $$USER)

NODE_APP_IMG=nestjs:node-app
NODE_WORKER_IMG=nestjs:node-worker

# Use the docker buildkit enhancements, see https://docs.docker.com/develop/develop-images/build_enhancements/
export DOCKER_BUILDKIT=1

EXPOSE_PORT?=3000

# Run Docker compose (with CI overrides)
DOCKER_COMPOSE:=EXPOSE_PORT=$(EXPOSE_PORT) \
	COMPOSE_DOCKER_CLI_BUILD=1 \
	docker compose \
	-p $(PROJECT_NAME) \
	-f docker-compose.yml \
	-f docker-compose.dev.yml

# Builds all Docker images
docker-images:
	docker build --pull -t $(NODE_APP_IMG) -f docker/node/app/Dockerfile .
	docker build --pull -t $(NODE_WORKER_IMG) -f docker/node/worker/Dockerfile .

dev-build: docker-images

# Starts containers and runs migrations
dev-up:
	$(DOCKER_COMPOSE) up --remove-orphans

dev-down:
	$(DOCKER_COMPOSE) down

dev-clean:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) rm -s -v --force

dev-shell-node:
	$(DOCKER_COMPOSE) run --entrypoint /bin/sh node-app

# Grab a shell on the node test running worker
dev-shell-node-worker:
	$(DOCKER_COMPOSE) run --entrypoint /bin/sh node-worker

artifacts-dir:
	mkdir -p artifacts

API_DOCS_IMAGE=api-docs
API_DOCS=docker run --rm -v "${PWD}:/srv" -w /srv $(API_DOCS_IMAGE)

docker-image-docs:
	docker build -t $(API_DOCS_IMAGE) -f docker/api-docs/Dockerfile api-docs/

# Build API docs
lint-docs: docker-image-docs
	$(API_DOCS) openapi lint api-docs/spec/api.yml

# Bundles multi-file OAS into a single YAML file
build-docs: lint-docs
	mkdir -p docs
	$(API_DOCS) openapi bundle api-docs/spec/api.yml -o api-docs/openapi.yml
	$(API_DOCS) redoc-cli bundle api-docs/openapi.yml \
		--options.disableSearch=true \
		--options.hideHostname=true \
		--options.hideSchemaTitles=true \
		--options.noAutoAuth=true
	mv redoc-static.html api-docs/index.html

# Grab an interactive shell to use openapi tooling
shell-docs:
	docker run --rm -it -v "${PWD}:/srv" -w /srv $(API_DOCS_IMAGE) /bin/ash
