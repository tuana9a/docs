#!/bin/bash
input="temp.txt"
while IFS= read -r line
do
    sudo iptables -D $line
done < "$input"

for tmp in $(cat temp.txt)
do
    echo sudo iptables -D $tmp
done