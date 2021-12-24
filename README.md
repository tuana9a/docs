# docs
my personal note about everything I've learned

I've deploy all my docs to [docs.tuana9a.tech](https://docs.tuana9a.tech)

# how to run

set the environment variable include PORT, ADDRESS, SECRET by

`export PORT=80`

`export ADDRESS=127.0.0.1`

`export SECRET=S3CR3T`

then

`java jar docs-1.0.0.jar`

or simple specify it in command line

`PORT=80 ADDRESS=127.0.0.1 SECRET=S3CR3T java -jar docs-1.0.0.jar`

or

`java -jar docs-1.0.0.jar --server.port=80 --server.address=127.0.0.1 --custom.secret=S3CR3T`

just change the value of each variable to match your need