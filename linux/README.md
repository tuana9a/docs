# Linux

My knowledge about linux

## Shell

là thằng sẽ thực thi lệnh mà bạn nhập vào
tương tác với hệ điều hành để trả ra output cho bạn

một hệ điều hành có thể có nhiều shell, VD:

- `bash`
  - hoặc `sh`
  - một shell phổ biến nhất hiện tại, là mặc định trên nhiều hệ điều hành
- `zsh`
  - một phiên bản tốt hơn của sh ?
- `fish`
  - autocompletion, syntax hightlight

mỗi shell sẽ có syntax và các chức năng khác nhau, bản thân shell cho phép lập trình bằng cách viết những đoạn mã đó vào một file, sau đó bạn có thể chạy đoạn mã đó như một chương trình

## POSIX

là một chuẩn cho các shell của linux giống EMAScript cho Javascript vậy

## File System

quote: **"Everything in linux is file"**

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

contains opt (stand for **option** or **optional**) software packages that you
or your vendor place in here to use later

### `/proc`

contains pesudo file system that is **appear when startup**
and **disappear when shutdown**

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

## `/dev` explained

![./img/dev.jpeg](./img/dev.jpeg)
