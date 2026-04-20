# Laravel Inertia Dockerized Template

## 🚀 Getting Started

### 1. Clone the Project

```bash
git clone https://github.com/margallostephen/Laravel_Inertia_Dockerized_Template.git
cd Laravel_Inertia_Dockerized_Template
```

---

### 2. Setup the Application

Copy `.env.example` and rename it to `.env`:

```bash
cp .env.example .env
```

Then paste the following values into your `.env` file:

```env
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
CACHE_STORE=redis
REDIS_HOST=redis

REDIS_CLIENT=phpredis
REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_SCHEME=null
MAIL_HOST=mailpit
```

---

### 3. Run the Following Commands

| Command           | Description                        |
|-------------------|------------------------------------|
| `make up`         | Start the containers               |
| `make install`    | Install Composer dependencies      |
| `make key`        | Generate application key           |
| `make migrate`    | Set up the database                |
| `make fresh-node` | Install Node packages              |
| `make dev`        | Run the development server         |
| `make perm`       | Fix permission issues              |

---

## 🌐 Access the Application

| Service       | URL                          |
|---------------|------------------------------|
| Application   | http://localhost:8000/       |
| Mailpit Client| http://localhost:8025/       |
