clear:
	sudo rm -r -f ./db-data

createdb:
	docker exec -it gobank-postgres-1 createdb --username=postgres bank

dropdb:
	docker exec -it gobank-postgres-1 dropdb --username=postgres bank

migrateup:
	migrate -path ./db/migration/ -database "postgresql://postgres:password@localhost:5433/bank?sslmode=disable" -verbose up

migratedown:
	migrate -path ./db/migration/ -database "postgresql://postgres:password@localhost:5433/bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

mockdb:
	mockgen -package mockdb -destination db/mock/store.go gobank/db/sqlc Store

server:
	go run main.go

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server clear