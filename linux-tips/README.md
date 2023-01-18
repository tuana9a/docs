# Tips

## take previous command with `!!`

```bash
apt update
# error permission denied
```

```bash
sudo !!
```

run the 102 th command in the history

```bash
!102
```

## Bash load .env file

```bash
export $(grep -v '^#' .env | xargs)
```

## Print current ip address

```bash
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

or

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

or

```bash
ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

## Find all occurrences of a string (basic usage)

Ex: Search package.json for any nashorn word

```bash
grep nashorn package.json
```

## Case insensitive search in a file set

Ex: Search for any file in npm/test that ends with .js
that has nashorn with case insensitive
so "Nashorn" still match

```bash
grep -i nashorn npm/test/*.js
```

## Find all the non-matching files

**note**: cái này **KHÔNG** recursive tìm trong folder con

Ex: Search for all files that don't have the word "nashorn"
in npm/test/

```bash
grep -iL nashorn npm/test/*
```

**note**: cái này **CÓ** recursive tìm trong folder con

nhưng **KHÔNG** tìm được các hidden files VD: `.env`, `.git`

do vậy xem [phần 4](#finding-patterns-into-hidden-files-and-recursively-into-sub-directories)

Ex: Search for all files that don't have the word "nashorn"

in npm/ and It sub directories

will search in "npm/" and "npm/test/" and "npm/module"

```bash
grep -iL nashorn npm/**/*
```

## Finding patterns into hidden files and recursively into sub-directories

This is not efficient as it will spawn a new grep process for each file

```bash
find npm/test/ -type f -exec grep -iL nashorn \{}\;
```

This may have issues with filenames containing space-like characters

```bash
grep -iL nashorn $(find npm/test/ -type f)
```

-r for recursive include hidden ones

```bash
grep -irL nashorn npm/test/
```

```bash
grep -irL nashorn npm/
```

## Filtering files by their name (using regular expressions)

```bash
grep -ir nashorn ./ | grep "^[^:]*\.java"
```

The first one is to use grep to find all files containing the pattern “nashorn”,
then pipe the output of that first command to a second grep instance
filtering out non-java source files:

**note**: Unless you specify the -F option, grep assumes the search pattern is a regular expression.

- `^` the start of the line
- `[^:]*` followed by a sequence of any characters except a colon
- `\.` followed by a dot (the dot has a special meaning in regex, so I had to protect it with a backslash to express I want a literal match)
- java and followed by the four letters “java.”

In practice, since grep will use a colon to separate the filename from the context,

I keep only lines having `.java` in the filename section.

Worth mention it would match also `.javascript` filenames.

This is something I let try solving by yourself if you want.

```bash
grep -ir nashorn ./ --include='*.java'
```

## put working directory on a stack

```bash
pushd
```

## pop that directory

```bash
popd
```

## determine file type

```bash
file FILEPATH
```

## update database for locate

```bash
updatedb
```

## locate a command

```bash
which COMMAND
```

## display bash command history

```bash
history
```

## display the on-line manual descriptions

```bash
whatis
```

## search the manual page names and descriptions

```bash
apropos
```

## an interface to the on-line reference manuals

```bash
man
```

## concatenate files and print on the standard output

```bash
cat file1 file2 file3 ...
```

## file perusal filter for crt viewing

```bash
more
```

```bash
less
```

## command line text editor

```bash
nano
```

## kill a running command

```bash
Ctrl + C
```

## log out of bash

```bash
exit
```

## builtin env variables

print random value between 0 - 32767

```bash
echo $RANDOM
```

print current shell

```bash
echo $SHELL
```

```bash
echo $USER
```

```bash
echo $PWD
```

```bash
echo $HOSTNAME
```

## add-all-rules-to-iptables from file

```bash
# this add all rules from file to ip tables
# can replace $1 to any file name you want
# example usage
# bash script.sh /home/tuana9a/rules.txt
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
# example usage
# bash script.sh /home/tuana9a/rules.txt
input="$1"
# read line by line then delete
while IFS= read -r line
do
    sudo iptables -D $line
done < "$input"
```
