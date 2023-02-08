init: up composer_install migrate seed
up:
	docker-compose up -d
composer_install:
	docker-compose run --rm app-php-zapolnite composer install
migrate:
	docker-compose run --rm app-php-zapolnite bash -c "cd app && php artisan migrate --force"
migrate-admin:
	docker-compose run --rm app-php-zapolnite bash -c "cd app-admin && php artisan migrate --force"
seed:
	docker-compose run --rm app-php-zapolnite php artisan db:seed
recreate-php:
	docker-compose up -d --force-recreate --no-deps --build app-php-zapolnite
recreate-pg:
	docker-compose up -d --force-recreate --no-deps --build app-postgres-zapolnite
recreate-nginx:
	docker-compose up -d --force-recreate --no-deps --build app-supervisor-zapolnite
recreate-sv:
	docker-compose up -d --force-recreate --no-deps --build app-nginx-zapolnite
gophp:
	docker-compose exec app-php-zapolnite bash -c "cd app"
gosv:
	docker-compose exec app-supervisor-zapolnite bash
docker-down-clear:
	docker-compose down -v --remove-orphans
tests:
	docker-compose run app-php-zapolnite php artisan test
