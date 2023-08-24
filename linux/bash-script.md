# bash-script

`#!` explain: the hash and the bang, shortened is "***shebang***"\
often placed at the beginning of a script

## variable

```bash
#! /bin/bash
text="tuan thich gemdino vl"
txt=$text
echo "My quote is \"$txt\"" # interpolation
```

```bash
#!/bin/bash
CURRENT_DIRECTORY=`pwd`
echo "You are in $CURRENT_DIRECTORY"
```

read user input with `read`

```bash
#!/bin/bash

echo -n "What is your name? "
read NAME
echo "Hello $NAME!"
```

## special variable

read command line params

```bash
#!/bin/bash
echo "param1 is $1, param2 is $2, param4 is $4, param3 is $3"
```

```shell
tuana9a@linux:~$./test.sh 1 2 3 4
param1 is 1, param2 is 2, param4 is 4, param3 is 3
```

read previous command return code (0-255) with `$?`

```shell
sysadmin@localhost:~$ grep -q root /etc/passwd # sucess
sysadmin@localhost:~$ echo $?
0
sysadmin@localhost:~$ grep -q slartibartfast /etc/passwd # error
sysadmin@localhost:~$ echo $?
1
```

The `$!` variable is a special shell variable that stores the PID of the most recently executed background process

```bash
#!/bin/bash
nohup ~/.dropbox-dist/dropboxd >> run.log 2>&1 & echo $! > dropboxd.pid
```

the above command mean: run dropboxd in background, make `stdout`, `stderr` append to run.log\
then take most recent background process `PID`, output it to dropboxd.pid

## conditionals

(or branching)

```bash
if somecommand; then
  # do this if somecommand has an exit code of 0 (sucess)
fi
```

introduce [`test`](https://github.com/tuana9a/linux-commands/blob/master/test.md) command

```shell
tuana9a@tuana9a-XPS-13-9370:~$ if test 1 -eq 1; then echo equals; else echo not equals; fi
equals
tuana9a@tuana9a-XPS-13-9370:~$ if test 1 -eq 2; then echo equals; else echo not equals; fi
not equals
```

the `[ ]` works similar to `test` command

```bash
if [ "$1" = "hello" ]; then
  echo "hello yourself"
elif [ "$1" = "goodbye" ]; then
  echo "nice to have met you"
  echo "I hope to see you again"
else
  echo "I didn't understand that"
fi
```

```bash
# or operator
if [ 2 -gt 1 -o 2 -lt 3 ]; then echo true; else echo false; fi
```

morden bash with double square brackets

```bash
if [[ 2 > 1 || 2 < 3 ]]; then echo true; else echo false; fi
```

```bash
#! /bin/bash
read yourname
if [ $yourname ]; then
  echo "$yourname is nice"
else
  echo "$youname is empty"
fi
```

switch case

```bash
#!/bin/bash
case "$1" in
  hello|hi) # hi or hello
    echo "hello yourself"
    ;; # must closed with two semicolons
  goodbye)
    echo "nice to have met you"
    echo "I hope to see you again"
    ;;
  t*) # start withs "t"
    echo "t $1";;
  *) # everything else
    echo "I didn't understand that"
esac
```

## loop

```bash
#! /bin/bash
for i in file1 file2 file3
do
  command1 $i
  command2
done
```

with glob character

```bash
#! /bin/bash
for i in *.txt
do
  cat $i
done
```

```bash
#!/bin/bash
SERVERS="servera serverb serverc"
for S in $SERVERS; do
  echo "Doing something to $S"
done
```

```bash
#!/bin/bash
i=0
while [ $i -lt 10 ]; do
  echo $i
  i=$(( $i + 1 ))
done
echo “Done counting”
```

```bash
#!/bin/bash
i=0
while read -r line; do
  echo "line$i $line"
  i=$(($i + 1))
done < /tmp/test.txt
```
