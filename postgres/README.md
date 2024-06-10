# WIP postgres

```bash
sudo docker run --rm -it --network host -v /tmp/dump/:/tmp/dump/ postgres:16 pg_dumpall -h

source .env && sudo docker run --rm -it --network host -v /tmp/dump/:/tmp/dump/ postgres:16 pg_dumpall -h localhost -U $POSTGRES_USER > /tmp/dump/psql.sql

sudo docker run --rm -it --network host -v /tmp/dump/:/tmp/dump/ postgres:16 pg_dumpall -h localhost > /tmp/dump/psql.sql
sudo docker run --rm -it --network host -v /tmp/dump/:/tmp/dump/ postgres:16 psql -h localhost -f /tmp/dump/psql.sql postgres
```
