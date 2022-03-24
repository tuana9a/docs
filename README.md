# docs

my personal note about everything I've learned

# how to run

```bash
# build first
# by default after runing below command the output will be in "target/" 
mvn package

# change bind address or port if you want
# window or linux with application.properties
java -jar ./target/docs-1.0.0.jar --server.port=80 --server.address=127.0.0.1

# linux with env variable
PORT=80 ADDRESS=127.0.0.1 java -jar ./target/docs-1.0.0.jar
PORT=80 ADDRESS=127.0.0.1 nohup java -jar ./target/docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```
