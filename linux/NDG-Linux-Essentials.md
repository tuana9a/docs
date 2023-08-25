# NDG Linux Essentials

## Facts

**Linux** should be **GNU/Linux** because linux is just the kernel,
the OS we call linux often ships with many GNU tools.

## Distribution

A Linux distribution is a bundle of software,
typically comprised of the Linux kernel, utilities, management tools,
and even some application software in a package which also includes the means to update core software and install additional applications.

## Open Source Licensing

- Ownership – Who owns the intellectual property behind the software?
- Money Transfer – How does money change hands, if at all?
- Licensing – What do you get? What can you do with the software? Can you use it on only one computer? Can you give it to someone else?

### EULA

End User License Agreement, is a custom legal document that you must click through, indicating your acceptance, in order to install the software.

### GPLv2

GNU General Public License version 2. This license, among other things, says that the source code must be made available to anyone who asks and that anyone is allowed to make changes.

### FOSS

Free and Open Source Software refers to software where this right has been given up; anyone is allowed to view the source code and redistribute it.

### (FLOSS)

Free/Libre/Open Source Software

### FSF

Only a few years after the development of the GNU project, Richard Stallman founded the Free Software Foundation (FSF).

### BSD

(Berkeley Software Distribution)

### CC

Creative Commons

The Creative Commons (CC) organization has created the Creative Commons Licenses which try to address the intentions behind FOSS licenses for non-software entities. CC licenses can also be used to restrict commercial use if that is the desire of the copyright holder. The CC licenses are made up of the following set of conditions the creator can apply to their work:

- Attribution (BY) – All CC licenses require that the creator must be given credit, without implying that the creator endorses the use.

- ShareAlike (SA) – This allows others to copy, distribute, perform, and modify the work, provided they do so under the same terms.

- NonCommercial (NC) – This allows others to distribute, display, perform, and modify the work for any purpose other than commercially.

- NoDerivatives (ND) – This allows others to distribute, display, and perform only original copies of the work. They must obtain the creator’s permission to modify it.
These conditions are then combined to create the six main licenses offered by Creative Commons:

- Attribution (CC BY) – Much like the BSD license, you can use CC BY content for any use but must credit the copyright holder.

- Attribution ShareAlike (CC BY-SA) – A copyleft version of the Attribution license. Derived works must be shared under the same license, much like in the Free Software ideals.

- Attribution NoDerivs (CC BY-ND) – You may redistribute the content under the same conditions as CC-BY but may not change it.

- Attribution-NonCommercial (CC BY-NC) – Just like CC BY, but you may not use it for commercial purposes.

- Attribution-NonCommercial-ShareAlike (CC BY-NC-SA) – Builds on the CC BY-NC license but requires that your changes be shared under the same license.

- Attribution-NonCommercial-NoDerivs (CC BY-NC-ND) – You are sharing the content to be used for non-commercial purposes, but people may not change the content.

- No Rights Reserved (CC0) – This is the Creative Commons version of public domain.

## MOTD

(message of the day)

the hello message when you login to the terminal

## POSIX

(Portable Operating System Interface) is a set of standard operating system interfaces based on the Unix operating system.

## PATH variable

It contains a list that defines which directories the shell looks in to find commands.
If a valid command is entered and the shell returns a "command not found" error, it is because the Bash shell was unable to locate a command by that name in any of the directories included in the path.
The first command found in these directories will be used.

## Quotes

There are three types of quotes that have special significance to the Bash shell: double quotes ", single quotes ', and back quotes `. Each set of quotes alerts the shell not to treat the text within the quotes in the normal way.

### Double Quotes

Double quotes stop the shell from interpreting some metacharacters (special characters), including glob characters.

Glob characters, also called wild cards, are symbols that have special meaning to the shell; they are interpreted by the shell itself before it attempts to run any command. Glob characters include the asterisk * character, the question ? mark character, and the brackets [ ], among others.

```bash
echo "The glob characters are *, ? and [ ]"
# The glob characters are *, ? and [ ]
```

Double quotes still allow for command substitution, variable substitution, and permit some other shell metacharacters. The following demonstration shows that the value of the PATH variable is still displayed:

```bash
echo "The path is $PATH"
# The path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

### Single Quotes

Single quotes prevent the shell from doing any interpreting of special characters, including globs, variables, command substitution and other metacharacters.

For example, to make the $ character simply mean a $, rather than it acting as an indicator to the shell to look for the value of a variable, execute the second command displayed below:

```bash
echo The car costs $100
# The car costs 00
echo 'The car costs $100'
# The car costs $100
```

### Backslash Character

There is also an alternative technique to essentially single quote a single character. Consider the following message:

The service costs $1 and the path is $PATH
If this sentence is placed in double quotes, $1 and $PATH are considered variables.

```bash
echo "The service costs $1 and the path is $PATH"
# ‌⁠​​⁠​The service costsand the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games 
```

If it is placed in single quotes, $1 and $PATH are not considered variables.

```bash
echo 'The service costs $1 and the path is $PATH'
# The service costs $1 and the path is $PATH
```

But what if you want to have $PATH treated as a variable and $1 not?

In this case, use a backslash \ character in front of the dollar sign $ character to prevent the shell from interpreting it. The command below demonstrates using the \ character:

```bash
echo The service costs \$1 and the path is $PATH
# The service costs $1 and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

### Backquotes

Backquotes, or backticks, are used to specify a command within a command, a process called command substitution. This allows for powerful and sophisticated use of commands.

While it may sound confusing, an example should make things more clear. To begin, note the output of the date command:

```bash
date
# Mon Nov4 03:35:50 UTC 2018
```

Now, note the output of the echo command:

```bash
echo Today is date
# Today is date
```

In the previous command, the word date is treated as regular text, and the shell passes date to the echo command. To execute the date command and have the output of that command sent to the echo command, put the date command in between two backquote characters:

```bash
echo Today is `date` 
# Today is Mon Nov 4 03:40:04 UTC 2018
```

seems to equals with

```bash
echo Today is $(date)
# Today is Mon Nov 4 03:40:04 UTC 2018
```

## Semicolon

`command1; command2; command3`

The semicolon ; character can be used to run multiple commands, one after the other. Each command runs independently and consecutively (sequentially); regardless of the result of the first command, the second command runs once the first has completed, then the third and so on.

```bash
helloworld; cal 2 2030; cal 3 2030 

Command 'helloworld' not found, did you mean:

  command 'hello-world' from snap hello-world (6.4)

See 'snap info <snapname>' for additional versions.

   February 2030
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28

     March 2030
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
```

## Double Ampersand

`command1 && command2`

The double ampersand && acts as a logical "and"; if the first command is successful, then the second command will also run. If the first command fails, then the second command will not run.

To better understand how this works, consider first the concept of failure and success for commands. Commands succeed when they work properly and fail when something goes wrong. For example, consider the ls command. The command succeeds if the given directory is accessible and fails if it isn't.

In the following example, the first command succeeds because the /etc/ppp directory exists and is accessible while the second command fails because there is no /junk directory:

```bash
ls /etc/ppp
# ip-down.d  ip-up.d 
ls /etc/junk 
# ls: cannot access /etc/junk: No such file or directory
```

To use the success or failure of the ls command in conjunction with && execute commands like the following. In the first example, the echo command is executed because the ls command succeeds:

```bash
ls /etc/ppp && echo success
# ip-down.d  ip-up.d
# success
```

In the second example, the echo command isn't executed because the ls command fails:

```bash
ls /etc/junk && echo success
# ls: cannot access /etc/junk: No such file or directory
```

## Double Pipe

`command1 || command2`

The double pipe || is a logical "or". Depending on the result of the first command, the second command will either run or be skipped.

With the double pipe, if the first command runs successfully, the second command is skipped; if the first command fails, then the second command is run. In other words, you are essentially telling the shell, "Either run this first command or the second one”.

In the following example, the echo command only executes if the ls command fails:

```bash
ls /etc/ppp || echo failed 
# ip-down.d  ip-up.d
ls /etc/junk || echo failed
# ls: cannot access /etc/junk: No such file or directory 
# failed
```

```bash
sysadmin@localhost:~$ false || echo Fail Or 
Fail Or
sysadmin@localhost:~$ true || echo Nothing to see here
sysadmin@localhost:~$
```

## File Type

| Symbol | File Type      | Description                                                                |
| ------ | -------------- | -------------------------------------------------------------------------- |
| d      | directory      | A file used to store other files.                                          |
| -      | regular file   | Includes readable files, images files, binary files, and compressed files. |
| l      | symbolic link  | Points to another file.                                                    |
| s      | socket         | Allows for communication between processes.                                |
| p      | pipe           | Allows for communication between processes.                                |
| b      | block file     | Used to communicate with hardware.                                         |
| c      | character file | Used to communicate with hardware.                                         |

## Globbing

also known as wildcards - special charaters in shell.
It specify patterns of filenames so you can execute a command that affect many files

glob characters are interpreted by the shell before it attempts to run any command.
So it can be used with any command.

```bash
echo /etc/t* # starts with t
```

```shell
sysadmin@localhost:~$ echo D*n*s
Documents Downloads 
```

```shell
sysadmin@localhost:~$ echo D????????
Documents Downloads
```

```shell
sysadmin@localhost:~$ echo ?????*s
Documents Downloads Pictures Templates Videos
```

`?????*s` to mean "match filenames that begin with any five characters,
then have zero or more of any characters and then end with an s character".

```shell
sysadmin@localhost:~$ echo /etc/[gu]* # starts with g or u
/etc/gai.conf /etc/groff /etc/group /etc/group- /etc/gshadow /etc/gshadow- /etc/
gss /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf
```

```shell
sysadmin@localhost:~$ echo /etc/*[0-9]* # contains one number
/etc/X11 /etc/dbus-1 /etc/iproute2 /etc/mke2fs.conf /etc/python3 /etc/python3.6 
/etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d /etc/rc4.d /etc/rc5.d /etc/rc6.d
```

```shell
sysadmin@localhost:~$ echo /etc/[!a-t]* # not start withs a to t
/etc/X11 /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf 
/etc/vim /etc/vtrgb /etc/wgetrc /etc/xdg
```

## Input/Output Redirection

Input/Output (I/O) redirection allows for command line information to be passed to different streams.\
Before discussing redirection, it is important to understand the standard streams.

### STDIN

Standard input, or **STDIN**, is information entered normally by the user via the keyboard.\
When a command prompts the shell for data, the shell provides the user with the ability to type commands that, in turn, are sent to the command as STDIN.

### STDOUT

Standard output, or **STDOUT**, is the normal output of commands.\
When a command functions correctly (without errors) the output it produces is called **STDOUT**.\
By default, **STDOUT** is displayed in the terminal window where the command is executing. **STDOUT** is also known as stream or channel **#1**.

```shell
sysadmin@localhost:~$ echo "Line 1" > example.txt
sysadmin@localhost:~$ cat example.txt                                  
Line 1
sysadmin@localhost:~$ echo "New line 1" > example.txt # will overwrite existing content
sysadmin@localhost:~$ cat example.txt
New line 1
sysadmin@localhost:~$ echo "Another line" >> example.txt # append to existing content
sysadmin@localhost:~$ cat example.txt
New line 1
Another line
```

### STDERR

Standard error, or **STDERR**, is error messages generated by commands.\
By default, **STDERR** is displayed in the terminal window where the command is executing. **STDERR** is also known as stream or channel **#2**.‌

I/O redirection allows the user to redirect STDIN so that data comes from a file and **STDOUT/STDERR** so that output goes to a file. Redirection is achieved by using the arrow `<` `>` characters.

```shell
sysadmin@localhost:~$ ls /fake
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ ls /fake > output.txt # default redirect STDOUT, so STDERR still go to the screen
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ ls /fake 2> error.txt # specify 2> will make error go to that file
sysadmin@localhost:~$ cat error.txt
ls: cannot access /fake: No such file or directory
```

### Redirect multiple streams

use `&>`\
The `&>` character set means both `1>` and `2>`

```shell
sysadmin@localhost:~$ ls /fake /etc/ppp &> all.txt
sysadmin@localhost:~$ cat all.txt # note: stderror messages on top of stdout
ls: cannot access /fake: No such file or directory
/etc/ppp:
ip-down.d
ip-up.d
```

```shell
sysadmin@localhost:~$ ls /fake /etc/ppp > example.txt 2> error.txt # stdout, stderror go to different files
sysadmin@localhost:~$ cat error.txt
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ cat example.txt
/etc/ppp:
ip-down.d
ip-up.d
```

To redirect both standard output (stdout) and standard error (stderr) to one file,\
first redirect stdout to a file and then redirect stderr to that same file by using the notation `2>&1`.

Your output should be similar to the following:

```shell
sysadmin@localhost:~$ find /etc -name hosts > find.out 2>&1
sysadmin@localhost:~$ cat find.out
/etc/hosts
find: '/etc/ssl/private': Permission denied
sysadmin@localhost:~$
```

The `2>&1` part of the command means "send the stderr (channel 2) to the same place where stdout (channel 1) is going".

## Computer Hardware

### Processors

```bash
arch
```

```bash
lscpu
```

```bash
less /proc/cpuinfo
```

### RAM (Random Access Memory)

```bash
free -m # round to megabytes
```

```bash
free -g # round to gigabytes
```

### Buses

A bus is a high-speed connection that allows communication between computers or the components inside a computer.\
The motherboard has buses that allow for multiple devices to connect to the system, including the Peripheral Component Interconnect (PCI) and Universal Serial Bus (USB).\
The motherboard also has connectors for monitors, keyboards and mice.

Devices connected internally are usually cold-plug, meaning the system must be shut down in order to connect or disconnect a device.\
USB devices are hot-plug, meaning they can be connected or disconnected while the system is running.

```bash
lspci
```

list pci buses with theirs used kernel, modules

```bash
lspci -k
```

```bash
lsusb
```

list loaded modules

```bash
lsmod
```

### Hard Drives

Hard drives are divided into one or more partitions.\
A partition is a logical division of a hard drive, designed to take a large amount of available storage space and break it up into smaller areas.\
While it is common on Microsoft Windows to have a single partition for each hard drive, on Linux distributions, multiple partitions per hard drive is common.

Some hard drives make use of a partitioning technology called Master Boot Record (MBR) while others make use of a partitioning type called GUID Partitioning Table (GPT).\
The MBR type of partitioning has been used since the early days of the Personal Computer (PC), and the GPT type has been available since the year 2000.

An old term used to describe an internal hard disk is fixed disk, as the disk is fixed (not removable).\
This term gave rise to several command names: the `fdisk`, `cfdisk` and `sfdisk` commands, which are tools for working with the MBR partitioned disks.

The GPT disks use a newer type of partitioning, which allows the user to divide the disk into more partitions than what MBR supports.\
GPT also allows having partitions which can be larger than two terabytes (MBR does not).\
The tools for managing GPT disks are named similarly to their fdisk counterparts: `gdisk`, `cgdisk`, and `sgdisk`.

There is also a family of tools that attempt to support both MBR and GPT type disks. This set of tools includes the `parted` command and the graphical `gparted` tool.

Hard drives are associated with file names (called device files) that are stored in the /dev directory. Each device file name is made up of multiple parts.

- **File Type**\
The file name is prefixed based on the different types of hard drives.\
IDE (Intelligent Drive Electronics) hard drives begin with `hd`, while USB, SATA (Serial Advanced Technology Attachment) and SCSI (Small Computer System Interface) hard drives begin with `sd`.

- **Device Order**\
Each hard drive is then assigned a letter which follows the prefix. For example, the first IDE hard drive would be named `/dev/hda` and the second would be `/dev/hdb`, and so on.

- **Partition**\
Finally, each partition on a disk is given a unique numeric indicator. For example, if a USB hard drive has two partitions, they could be associated with the `/dev/sda1` and `/dev/sda2` device files.

## Optical Drives

Optical drives, often referred to as CD-ROMs, DVDs, or Blu-Ray, are removable storage media.\
While some devices used with optical disks are read-only, others are capable of burning (writing to) disks, when using a writable type of disk.\
There are various standards for writable and rewritable disks, such as CD-R, CD+R, DVD+RW, and DVD-RW.

Where these removable disks are mounted in the file system is an important consideration for a Linux administrator.\
Modern distributions often mount the disks under the /media folder, while older distributions typically mount them under the /mnt folder.\
For example, a USB thumb drive might be mounted on the /media/usbthumb path.

Upon mounting, most GUI interfaces prompt the user to take some action, such as open the contents of the disk in a file browser or start a media program. When the user is finished using the disk, it is necessary to unmount it using a menu or the umount command.
