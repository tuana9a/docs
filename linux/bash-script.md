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
