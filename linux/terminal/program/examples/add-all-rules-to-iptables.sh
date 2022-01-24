# this add all rules from file to ip tables
# can replace $1 to any file name you want
# example usage bash script.sh /home/tuana9a/rules.txt
for tmp in $(cat "$1")
do
    echo sudo iptables -D $tmp
done