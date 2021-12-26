# pattern không log pid
nohup COMMAND >> run.log 2>&1 &

# pattern log cả pid
nohup COMMAND >> run.log 2>&1 & echo $! > run.pid

# example with python
nohup python main.py >> run.log 2>&1 &
nohup python main.py >> run.log 2>&1 & echo $! > run.pid

# example nodejs
nohup node dist/main.js >> run.log 2>&1 &
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid

# example with java
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 &
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
PORT=4000 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid