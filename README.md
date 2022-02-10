# docs

my personal note about everything I've learned

I've deploy all my docs to [docs.tuana9a.tech](https://docs.tuana9a.tech)

# how to run

```bash
# feel free to change bind address or port
# window or linux with application.properties
java -jar docs-1.0.0.jar --server.port=80 --server.address=127.0.0.1

# linux with env variable
PORT=80 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```
