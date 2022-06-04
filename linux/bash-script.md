# params

```bash
#! /bin/bash
STRING="tuan thich gemdino vai lua"
echo "my quote is \"$STRING\""
echo "param1 is $1, param2 is $2, param4 is $4, param3 is $3"
echo $(whoami)
echo =================io======================
echo "what is your name"
read yourname
echo $yourname is nice, LIKE ME!
```

# conditions

```bash
#! /bin/bash
echo =================if else======================
read yourname
echo $yourname is nice, LIKE ME!
if [ $yourname ]; then
    echo "$yourname is nice"
else
    echo "$youname is empty, right?"
fi
```

# loop

```bash
#! /bin/bash
# for loop
for VARIABLE in file1 file2 file3
do
    command1 on $VARIABLE
    command2
    commandN
done
```

# builtin env variables

```bash
# print random value between 0 - 32767
echo $RANDOM

# print current shell
echo $SHELL

echo $USER

echo $PWD

echo $HOSTNAME
```

# Calculation

```bash
echo $(( 2 + 2 ))
# output: 4

echo $(( 2 * 3 ))
# output: 6

echo $(( 2 /3 ))
# output: 0

echo $(( 10 / 3 ))
# output: 3

echo $(( 10 % 3 ))
# output: 1

# Tips
echo $(( $RANDOM % 100 ))
# output: random number between 0 - 99
```

-   This only apply to arithmetic operation
    not like command in normal $(comand...)

# Examples

## add-all-rules-to-iptables from file

```bash
# this add all rules from file to ip tables
# can replace $1 to any file name you want
# example usage bash script.sh /home/tuana9a/rules.txt
for tmp in $(cat "$1")
do
    echo sudo iptables -D $tmp
done
```

## delete-all-rules-to-iptables

```bash
#!/bin/bash

# this delete all rules in file to ip tables
# can replace $1 to any file name you want
# example usage bash script.sh /home/tuana9a/rules.txt
input="$1"
# read line by line then delete
while IFS= read -r line
do
    sudo iptables -D $line
done < "$input"
```
