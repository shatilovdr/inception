DOCKER_COMPOSE := docker compose -f ./srcs/docker-compose.yml

all: up

up:
	@if [ ! -d ~/data/db ]; then mkdir -p ~/data/db; fi
	@if [ ! -d ~/data/wp ]; then mkdir -p ~/data/wp; fi
	@$(DOCKER_COMPOSE) up --build -d

down:
	@$(DOCKER_COMPOSE) down

ps:
	@$(DOCKER_COMPOSE) ps

logs:
	@$(DOCKER_COMPOSE) logs

clean: down
	@if [ -d ~/data ]; then \
		sudo rm -fr ~/data; \
	fi

fclean: clean
	@$(DOCKER_COMPOSE) down --volumes --rmi all
	@echo "Docker images, volumes, and networks have been removed."

re: down up

help:
	@echo "Makefile for managing Docker Compose setup"
	@echo "Targets:"
	@echo "  all         Starts the Docker Compose setup (same as 'make up')"
	@echo "  up          Starts the Docker Compose setup, creating data directories if needed"
	@echo "  down        Stops and removes Docker containers"
	@echo "  ps          Shows the status of Docker containers"
	@echo "  logs        Displays logs from all Docker containers"
	@echo "  clean       Stops and removes Docker containers; removes data directories"
	@echo "  fclean      Fully cleans Docker: Stops and removes containers, images, volumes, networks"
	@echo "  re          Rebuilds Docker images and restarts Docker containers"
	@echo "  help        Displays this help message"

.PHONY: all up down ps logs clean fclean re help