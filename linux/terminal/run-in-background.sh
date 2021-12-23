# python
nohup python main.py >> run.log 2>&1 &

# nodejs
nohup node dist/main.js >> run.log 2>&1 &

# java
nohup java -jar app.jar >> run.log 2>&1 &