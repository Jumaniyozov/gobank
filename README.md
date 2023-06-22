### DB migration 

```migrate create -ext sql -dir db/migration -seq add_users```

### DB mock  

```mockgen -package mockdb -destination db/mock/store.go gobank/db/sqlc Store```