# add-all-rules-to-iptables from file

```bash
# this add all rules from file to ip tables
# can replace $1 to any file name you want
# example usage bash script.sh /home/tuana9a/rules.txt
for tmp in $(cat "$1")
do
    echo sudo iptables -D $tmp
done
```

# delete-all-rules-to-iptables

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