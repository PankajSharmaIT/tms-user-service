.PHONY: help build up down logs clean rebuild stop start

help:
	@echo "Traffic Monitoring System - Docker Commands"
	@echo "==========================================="
	@echo "make build          - Build Docker images"
	@echo "make up             - Start all services"
	@echo "make down           - Stop all services"
	@echo "make rebuild        - Rebuild and restart services"
	@echo "make logs           - View application logs"
	@echo "make logs-db        - View PostgreSQL logs"
	@echo "make clean          - Remove containers, networks, and volumes"
	@echo "make stop           - Stop all services without removing"
	@echo "make start          - Start stopped services"
	@echo "make ps             - Show service status"
	@echo "make shell-app      - SSH into app container"
	@echo "make shell-db       - SSH into database container"
	@echo "make test-db        - Test database connection"

build:
	docker-compose build

up:
	docker-compose up -d
	@echo "✓ Services started. Application available at http://localhost:8080"

down:
	docker-compose down

stop:
	docker-compose stop

start:
	docker-compose start

rebuild:
	docker-compose up -d --build

ps:
	docker-compose ps

logs:
	docker-compose logs -f userservice

logs-db:
	docker-compose logs -f postgres

logs-all:
	docker-compose logs -f

clean:
	docker-compose down -v
	@echo "✓ All containers, networks, and volumes removed"

shell-app:
	docker-compose exec userservice /bin/sh

shell-db:
	docker-compose exec postgres psql -U postgres -d traffic_monitoring

test-db:
	docker-compose exec postgres pg_isready -U postgres

# Prune unused Docker resources
prune:
	docker system prune -f
	@echo "✓ Cleaned up unused Docker resources"

