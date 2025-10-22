.PHONY: init test

DOCKER_COMPOSE ?= docker compose
SERVICE ?= tf

init:
	$(DOCKER_COMPOSE) run --rm $(SERVICE) init

test:
	$(DOCKER_COMPOSE) run --rm $(SERVICE) test


