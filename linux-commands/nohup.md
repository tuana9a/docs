# nohup

không log pid

```bash
nohup COMMAND >> run.log 2>&1 &
```

pattern log cả pid

```bash
nohup COMMAND >> run.log 2>&1 & echo $! > run.pid
```

python

```bash
nohup python main.py >> run.log 2>&1 &
```

```bash
nohup python main.py >> run.log 2>&1 & echo $! > run.pid
```

nodejs

```bash
nohup node dist/main.js >> run.log 2>&1 &
```

```bash
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid
```

java

```bash
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 &
```

```bash
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```

```bash
PORT=4000 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```
