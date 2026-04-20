Clone the project

git clone https://github.com/margallostephen/Laravel_Inertia_Dockerized_Template.git

cd Laravel_Inertia_Dockerized_Template

Setup the application

copy .env.example and rename to .env

Paste the value 

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

run in cli 

make up           - start the containers

make install      - install composer dependencies

make key          - generate key

make migrate      - setup database

make fresh-node   - install packages

make dev          - run dev

make perm         - fix permission issue

After setting up you may access the application at

http://localhost:8000/

Access the mail pit client

http://localhost:8025/