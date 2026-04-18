APP=app
NODE=node
COMPOSE=docker compose

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
# Utilities
# -------------------------

clean:
	rm -rf node_modules package-lock.json

fresh-node:
	$(COMPOSE) exec $(NODE) rm -rf node_modules package-lock.json
	$(COMPOSE) exec $(NODE) npm install