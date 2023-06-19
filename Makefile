createdb:
	docker exec -it gobank-postgres-1 createdb --username=postgres bank

dropdb:
	docker exec -it gobank-postgres-1 dropdb --username=postgres bank

.PHONY: postgres createdb dropdb