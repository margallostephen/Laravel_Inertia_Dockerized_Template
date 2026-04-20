APP=app
NODE=node
COMPOSE=docker compose

# IMPORTANT: prevent conflicts with file names like "artisan"
.PHONY: up down restart ps logs bash artisan migrate fresh cache-clear \
composer install require npm dev build install-node \
reverb queue logs-app logs-node logs-reverb \
db perm key optimize-clear reset test

# -------------------------
# Docker lifecycle
# -------------------------

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) down && $(COMPOSE) up -d --build

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f

# -------------------------
# Laravel (PHP container)
# -------------------------

bash:
	$(COMPOSE) exec $(APP) bash

artisan:
	$(COMPOSE) exec $(APP) php artisan $(cmd)

migrate:
	$(COMPOSE) exec $(APP) php artisan migrate

fresh:
	$(COMPOSE) exec $(APP) php artisan migrate:fresh --seed

cache-clear:
	$(COMPOSE) exec $(APP) php artisan optimize:clear

key:
	$(COMPOSE) exec $(APP) php artisan key:generate

optimize-clear:
	$(COMPOSE) exec $(APP) php artisan optimize:clear

# -------------------------
# Queue (VERY IMPORTANT)
# -------------------------

queue:
	$(COMPOSE) exec $(APP) php artisan queue:work

# -------------------------
# Composer
# -------------------------

composer:
	$(COMPOSE) exec $(APP) composer $(cmd)

install:
	$(COMPOSE) exec $(APP) composer install

require:
	$(COMPOSE) exec $(APP) composer require $(pkg)

# -------------------------
# Node / Vite
# -------------------------

npm:
	$(COMPOSE) exec $(NODE) npm $(cmd)

dev:
	$(COMPOSE) exec $(NODE) npm run dev -- --host 0.0.0.0

build:
	$(COMPOSE) exec $(NODE) npm run build

install-node:
	$(COMPOSE) exec $(NODE) npm install

# -------------------------
# Reverb (real-time)
# -------------------------

reverb:
	$(COMPOSE) exec $(APP) php artisan reverb:start --host=0.0.0.0 --port=8080

# -------------------------
# Logs (debugging)
# -------------------------

logs-app:
	$(COMPOSE) logs -f $(APP)

logs-node:
	$(COMPOSE) logs -f $(NODE)

logs-reverb:
	$(COMPOSE) logs -f reverb

# -------------------------
# Database
# -------------------------

db:
	$(COMPOSE) exec postgres psql -U laravel -d laravel

# -------------------------
# Permissions (FIXES YOUR ERROR)
# -------------------------

perm:
	$(COMPOSE) exec $(APP) chown -R www-data:www-data storage bootstrap/cache
	$(COMPOSE) exec $(APP) chmod -R 775 storage bootstrap/cache

# -------------------------
# Testing
# -------------------------

test:
	$(COMPOSE) exec $(APP) php artisan test

# -------------------------
# Reset / Cleanup
# -------------------------

reset:
	$(COMPOSE) down -v
	$(COMPOSE) up -d --build

clean:
	rm -rf node_modules package-lock.json

fresh-node:
	$(COMPOSE) exec $(NODE) rm -rf node_modules package-lock.json
	$(COMPOSE) exec $(NODE) npm install