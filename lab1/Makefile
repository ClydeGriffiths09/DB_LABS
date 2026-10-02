CONTAINER := pg-lab1

.PHONY: up down psql schema data test migrate

up:
	docker-compose up -d

down:
	docker-compose down

psql:
	docker exec -it $(CONTAINER) psql -U postgres -d postgres

schema:
	docker exec -i $(CONTAINER) psql -U postgres -d postgres < schema.sql

data:
	docker exec -i $(CONTAINER) psql -U postgres -d postgres < data.sql

test:
	docker exec -i $(CONTAINER) psql -U postgres -d postgres < constraints_test.sql

migrate:
	docker exec -i $(CONTAINER) psql -U postgres -d postgres < migration.sql