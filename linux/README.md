# Linux

My knowledge about linux

# Concepts

## Shell

là thằng sẽ thực thi nhiệm vụ thông tin lệnh mà bạn nhấp vào<br>
tương tác với hệ điều hành để trả ra output cho bạn

một hệ điều hành có thể có nhiều shell<br>
VD:

- `bash`
  - hoặc `sh`
  - một shell phổ biến nhất hiện tại, là mặc định trên nhiều hệ điều hành
- `zsh`
  - một phiên bản tốt hơn của sh ?
- `fish`
  - autocompletion, syntax hightlight

mỗi shell sẽ có syntax và các chức năng khá nhau

thường shell cho phép lập trình với các đoạn script sẵn<br>
mà có thể được thực thi sau đó

## POSIX

là một chuẩn cho các shell của linux giống EMAScript cho Javascript vậy

# File System

quote: **"Everything in linux is file"**

## file system explaination

### `/bin`

contains system binaries that require for os to work

link to /usr/bin

### `/boot`

contains file that are used to boot the system, includes

- ram
- boot loader

### `/dev`

contains device **file** that plug in our system

It could be:

- virtual device
- physical device

### `/home`

contains separate user home directory with their config files

### `/lib`

contains **shared** libraries that are used by the system and other programs

### `/media`

should display folder of media devices that plug in your computers

**note**: this not a file like in `/dev`

examples: I have a USB 64G, plug in my computer and its name is KINGSTON

so I will be able to access files in my USB via this path

`/media/tuana9a/KINGSTON/`

tuana9a is my username

### `/opt`

legacy, backword compatibility but still quite popular these day

contains opt (stand for **option** or **optional**) software packages that you<br>
or your vendor place in here to use later

### `/proc`

contains pesudo file system that is **appear when startup** and **disappear when shutdown**

contains infomation about every process running in the system

### `/root`

contains root user home directory,
**super** | **ultimate** | **pro** | **max** user

### `/run`

contains infomation at boot time

- who logged in
- what system deamons might be running

### `/sbin`

contains system binaries like `/bin` but staticly linked, so fewer dependencies

### `/srv`

contains files thay might be serve by ftp, webserver but nowaday that not
quite true anymore

### `/sys`

contains device drivers, kernel feature that running in your system

It offten refer as **"light" `/proc`**

### `/tmp`

store temporary files

### `/usr`

contains file that's useful for users accross the system

### `/var`

contains system specific variables file like:

- logs
- temporary message files
- config files if **not** in `/etc`
- `/var/www` for apache web server

# Shortcuts

![](./img/terminal-shortcut.jpeg)

| key binds  | action                                  |
| ---------- | --------------------------------------- |
| Ctrl + D   | signal bash that there is no more input |
| Ctrl + L   | redraw the screen                       |
| Ctrl + `+` | make text bigger in terminal emulator   |
| Ctrl + `-` | make text smaller in terminal emulator  |

```bash
# error permission denied
apt update

# take previous command with !!
sudo !!
# this time success

# run the 102 th command in the history
!102
```

# Print current ip address

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

# Find all occurrences of a string (basic usage)

```bash
# Ex: Search package.json for any nashorn word
grep nashorn package.json
```

# Case insensitive search in a file set

```bash
# Ex: Search for any file in npm/test that ends with .js
# that has nashorn with case insensitive
# so "Nashorn" still match
grep -i nashorn npm/test/*.js
```

# Find all the non-matching files

**note**: cái này **KHÔNG** recursive tìm trong folder con

```bash
# Ex: Search for all files that don't have the word "nashorn"
# in npm/test/
grep -iL nashorn npm/test/*
```

**note**: cái này **CÓ** recursive tìm trong folder con<br>
nhưng **KHÔNG** tìm được các hidden files VD: `.env`, `.git`<br>
do vậy xem [phần 4](#finding-patterns-into-hidden-files-and-recursively-into-sub-directories)

```bash
# Ex: Search for all files that don't have the word "nashorn"
# in npm/ and It sub directories
# will search in "npm/" and "npm/test/" and "npm/module"
grep -iL nashorn npm/**/*
```

# Finding patterns into hidden files and recursively into sub-directories

```bash
# This is not efficient as it will spawn a new grep process for each file
find npm/test/ -type f -exec grep -iL nashorn \{} \;
```

```bash
# This may have issues with filenames containing space-like characters
grep -iL nashorn $(find npm/test/ -type f)
```

```bash
# -r for recursive include hidden ones
grep -irL nashorn npm/test/
```

```bash
grep -irL nashorn npm/
```

# Filtering files by their name (using regular expressions)

```bash
# The first one is to use grep to find all files containing the pattern “nashorn”,
# then pipe the output of that first command to a second grep instance
# filtering out non-java source files:
grep -ir nashorn ./ | grep "^[^:]*\.java"
```

**note**: Unless you specify the -F option, grep assumes the search pattern is a regular expression.

- `^` the start of the line
- `[^:]*` followed by a sequence of any characters except a colon
- `\.` followed by a dot (the dot has a special meaning in regex,<br>
  so I had to protect it with a backslash to express I want a literal match)
- java and followed by the four letters “java.”

In practice, since grep will use a colon to separate the filename from the context,<br>
I keep only lines having `.java` in the filename section.<br>
Worth mention it would match also `.javascript` filenames.<br>
This is something I let try solving by yourself if you want.

# Filtering files by their name using grep

```bash
grep -ir nashorn ./ --include='*.java'
```

# Navigation

```bash
# put working directory on a stack
pushd
popd
```

```bash
# determine file type
file
```

```bash
# update database for locate
updatedb
```

```bash
# locate a command
which
```

```bash
# display bash command history
history
```

# Getting Help

```bash
# display the on-line manual descriptions
whatis
```

```bash
# search the manual page names and descriptions
apropos
```

```bash
# an interface to the on-line reference manuals
man
```

# Text Files

```bash
# concatenate files and print on the standard output
cat file1 file2 file3 ...
```

```bash
# file perusal filter for crt viewing
more
less
```

```bash
# command line text editor
nano
```

# Kill Programs and Log out

```bash
# kill a running command
Ctrl + C
```

```bash
# kill processes by name
killall
```

```bash
# log out of bash
exit
```
