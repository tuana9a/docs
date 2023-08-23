# bash-script

variable

```bash
#! /bin/bash
text="tuan thich gemdino vai lua"
echo "my quote is \"$text\""
echo "param1 is $1, param2 is $2, param4 is $4, param3 is $3"
echo $(whoami)
echo =================io======================
echo "what is your name"
read yourname
echo $yourname is nice, LIKE ME!
```

condition

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

loop

```bash
#! /bin/bash
for i in file1 file2 file3
do
  command1 $i
  command2
done
```

loop tip with glob character

```bash
#! /bin/bash
for i in *.txt
do
  cat $i
done
```
