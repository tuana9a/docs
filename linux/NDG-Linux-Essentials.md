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

```shell
sysadmin@localhost:~$ echo "The glob characters are *, ? and [ ]"
The glob characters are *, ? and [ ]
```

Double quotes still allow for command substitution, variable substitution, and permit some other shell metacharacters. The following demonstration shows that the value of the PATH variable is still displayed:

```shell
sysadmin@localhost:~$ echo "The path is $PATH"
The path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

### Single Quotes

Single quotes prevent the shell from doing any interpreting of special characters, including globs, variables, command substitution and other metacharacters.

For example, to make the $ character simply mean a $, rather than it acting as an indicator to the shell to look for the value of a variable, execute the second command displayed below:

```shell
sysadmin@localhost:~$ echo The car costs $100
The car costs 00
sysadmin@localhost:~$ 'The car costs $100'
The car costs $100
```

### Backslash Character

There is also an alternative technique to essentially single quote a single character. Consider the following message:

The service costs $1 and the path is $PATH
If this sentence is placed in double quotes, $1 and $PATH are considered variables.

```shell
sysadmin@localhost:~$ echo "The service costs $1 and the path is $PATH"
⁠​​⁠​The service costsand the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

If it is placed in single quotes, $1 and $PATH are not considered variables.

```shell
sysadmin@localhost:~$ 'The service costs $1 and the path is $PATH'
The service costs $1 and the path is $PATH
```

But what if you want to have $PATH treated as a variable and $1 not?

In this case, use a backslash \ character in front of the dollar sign $ character to prevent the shell from interpreting it. The command below demonstrates using the \ character:

```shell
sysadmin@localhost:~$ echo The service costs \$1 and the path is $PATH
The service costs $1 and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

### Backquotes

Backquotes, or backticks, are used to specify a command within a command, a process called command substitution. This allows for powerful and sophisticated use of commands.

While it may sound confusing, an example should make things more clear. To begin, note the output of the date command:

```shell
sysadmin@localhost:~$ date
Mon Nov4 03:35:50 UTC 2018
```

Now, note the output of the echo command:

```shell
sysadmin@localhost:~$ echo Today is date
Today is date
```

In the previous command, the word date is treated as regular text, and the shell passes date to the echo command. To execute the date command and have the output of that command sent to the echo command, put the date command in between two backquote characters:

```shell
sysadmin@localhost:~$ echo Today is `date`
Today is Mon Nov 4 03:40:04 UTC 2018
```

seems to equals with

```shell
sysadmin@localhost:~$ echo Today is $(date)
Today is Mon Nov 4 03:40:04 UTC 2018
```

## Semicolon

`command1; command2; command3`

The semicolon ; character can be used to run multiple commands, one after the other. Each command runs independently and consecutively (sequentially); regardless of the result of the first command, the second command runs once the first has completed, then the third and so on.

```shell
sysadmin@localhost:~$ helloworld; cal 2 2030; cal 3 2030

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

```shell
sysadmin@localhost:~$ ls /etc/ppp
ip-down.d  ip-up.d
sysadmin@localhost:~$ ls /etc/junk
ls: cannot access /etc/junk: No such file or directory
```

To use the success or failure of the ls command in conjunction with && execute commands like the following. In the first example, the echo command is executed because the ls command succeeds:

```shell
sysadmin@localhost:~$ ls /etc/ppp && echo success
ip-down.d  ip-up.d
success
```

In the second example, the echo command isn't executed because the ls command fails:

```shell
sysadmin@localhost:~$ ls /etc/junk && echo success
ls: cannot access /etc/junk: No such file or directory
```

## Double Pipe

`command1 || command2`

The double pipe || is a logical "or". Depending on the result of the first command, the second command will either run or be skipped.

With the double pipe, if the first command runs successfully, the second command is skipped; if the first command fails, then the second command is run. In other words, you are essentially telling the shell, "Either run this first command or the second one”.

In the following example, the echo command only executes if the ls command fails:

```bash
sysadmin@localhost:~$ ls /etc/ppp || echo failed
ip-down.d  ip-up.d
sysadmin@localhost:~$ ls /etc/junk || echo failed
ls: cannot access /etc/junk: No such file or directory
failed
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
| -      | regular file   | Includes readable files, images files, binary files, and compressed files. |
| d      | directory file | A file used to store other files.                                          |
| l      | symbolic link  | Points to another file.                                                    |
| b      | block file     | Used to communicate with hardware. Where data is read in blocks of data.   |
| c      | character file | Used to communicate with hardware. Where data is read one byte at a time.  |
| p      | pipe           | Allows for communication between processes.                                |
| s      | socket         | Allows for communication between processes.                                |

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

## Processes

The kernel provides access to information about active processes through a `pseudo filesystem` that is visible under the `/proc` directory. Hardware devices are made available through special files under the `/dev` directory, while information about those devices can be found in another pseudo filesystem under the `/sys` directory.

Pseudo filesystems appear to be real files on disk but exist only in memory. Most pseudo file systems such as `/proc` are designed to appear to be a hierarchical tree off the root of the system of directories, files and subdirectories, but in reality only exist in the system's memory, and only appear to be resident on the storage device that the root file system is on.

The `/proc` directory not only contains information about running processes, as its name would suggest, but it also contains information about the system hardware and the current kernel configuration.

The `/proc` directory is read, and its information utilized by many different commands on the system, including but not limited to top, free, mount, umount and many many others. It is rarely necessary for a user to mine the `/proc` directory directly—it’s easier to use the commands that utilize its information.

## Process Hierarchy

When the kernel finishes loading during the boot procedure, it starts the init process and assigns it a PID of **1**. This process then starts other system processes, and each process is assigned a PID in **sequential** order.

>Consider This\
>On a System V-based system, the init process would be the `/sbin/init` program.\
>On a systemd-based system, the `/bin/systemd` file is typically executed but is almost always a link to the `/lib/system/systemd` executable.\
>Regardless of which type of system init process that is being run, the information about the process can be found in the `/proc/1` directory.

As either of the init processes starts up other processes, they, in turn, may start up processes, which may start up other processes, on and on.\
When one process starts another process, the process that performs the starting is called the parent process and the process that is started is called the child process. When viewing processes, the parent PID is labeled **PPID**.

When the system has been running for a long time, it may eventually reach the **maximum** PID value,\
which can be viewed and configured through the `/proc/sys/kernel/pid_max` file.\
Once the largest PID has been used, the system "**rolls over**" and continues seamlessly by assigning PID values that are **available** at the bottom of the range.

```bash
pstree
# or
ps --forest
# list all processes
ps aux
# also list all processes
ps -ef
# filter with grep
ps -ef | grep firefox
ps -e | grep firefox
# filter by username
ps -u tuana9a
```

## Memory

Memory on a modern Linux system is governed and managed by the kernel.\
The hardware memory on the system is shared by all the processes on the system, through a method called `virtual addressing`.

- Vritual addressing make the system look like having more RAM capacity than the actual physical RAM capacity.\
It does this by allocating certain areas of a physical (or virtual) hard disk to be used in place of physical RAM.
- Virtual addressing allows many processes to access the same memory without conflicts or crashes.
- Memory is divided into blocks of equally sized units that can be addressed like any other resource on the system.
- Not only can the system access memory from local system addresses, but it can also access memory that is located elsewhere, such as on a different computer, a virtual device, or even on a volume that is physically located on another continent!

Kernel space is where code for the kernel is stored and executed. This is generally in a “protected” range of memory addresses and remains isolated from other processes with lower privileges.

User space, on the other hand, is available to users and programs. They communicate with the Kernel through “system call” APIs that act as intermediaries between regular programs and the Kernel. This system of separating potentially unstable or malicious programs from the critical work of the Kernel is what gives Linux systems the stability and resilience that application developers rely on.

## Filesystem Hierarchy Standard

Among the standards supported by the Linux Foundation is the **Filesystem Hierarchy Standard (FHS)**, which is hosted at the URL [https://www.pathname.com/fhs/](https://www.pathname.com/fhs/).

A standard is a set of rules or guidelines that it is recommended to follow. However, these guidelines certainly can be broken, either by entire distributions or by administrators on individual machines.

## Software Application Directories

Unlike the Windows operating system, where applications may have all of their files installed in a single subdirectory under the `C:\Program Files` directory, applications in Linux may have their files in multiple directories spread out throughout the Linux filesystem.\
For Debian-derived distributions, you can execute the `dpkg -L packagename` command to get the list of file locations.\
In Red Hat-derived distributions, you can run the `rpm -ql packagename` command for the list of the locations of the files that belong to that application.

The executable program binary files may go in the `/usr/bin` directory if they are included with the operating system, or else they may go into the `/usr/local/bin` or `/opt/application/bin` directories if they came from a third party.

The data for the application may be stored in one of the following subdirectories:

- `/usr/share`
- `/usr/lib`
- `/opt/application`
- `/var/lib`

The file related to documentation may be stored in one of the following subdirectories:

- `/usr/share/doc`
- `/usr/share/man`
- `/usr/share/info`

The global configuration files for an application are most likely to be stored in a subdirectory under the `/etc` directory, while the personalized configuration files (specific for a user) for the application are probably in a hidden subdirectory of the user's home directory.

## Library Directories

Libraries are files which contain code that is shared between multiple programs.\
Most library file names end in a file extension of `.so`, which means **shared object**.

Multiple versions of a library may be present because the code may be different within each file even though it may perform similar functions as other versions of the library.\
One of the reasons that the code may be different, even though it may do the same thing as another library file, is that it is compiled to run on a different kind of processor.\
For example, it is typical for systems that use code designed for 64-bit Intel/AMD type processors to have both 32-bit libraries and 64-bit libraries.

The libraries that support the essential binary programs found in the `/bin` and `/sbin` directories are typically located in either `/lib` or `/lib64`.

To support the `/usr/bin` and `/usr/sbin` executables, the `/usr/lib` and `/usr/lib64` library directories are typically used.

For supporting applications that are not distributed with the operating system, the `/usr/local/lib` and `/opt/application/lib` library directories are frequently used.

## Network Configuration Files

Name resolution on a Linux host is accomplished by 3 critical files: the `/etc/hosts`, `/etc/resolv.conf` and `/etc/nsswitch.conf` files.\
Together, they describe the location of name service information, the order in which to check resources, and where to go for that information.

`/etc/hosts` contains table of hostnames to IP addresses

`/etc/resolv.conf` contains IP addresses of nameservers.

```conf
nameserver 10.0.2.3
nameserver 10.0.2.4
```

The DNS resolution system will use the first name server for an attempted lookup of the name.\
If that is unavailable, or a timeout period is reached, the second server will then be queried for the name resolution.\
If a match is found, it is returned to the system and used for initiating a connection and is also placed in the DNS cache for a configurable time period.

`/etc/nsswitch.conf` This file can be used to modify where hostname lookups occur. It contains a particular entry that describes in what order name resolution sources are consulted.

```conf
hosts:          files dns
```

1. look up an entry in `/etc/hosts`
2. query dns from servers listed in `/etc/resolv.conf`

```conf
hosts:          dns files # search dns first then lookup in file
```

1. query dns from servers listed in `/etc/resolv.conf`
2. look up an entry in `/etc/hosts`

## Network Commands

```bash
ifconfig # old, deprecated
ip addr show # new, replacement
```

```bash
route # old
route -n # old
ip route # new
ip route show # new
```

## Users and Groups

On some distributions, creating a new user account also **automatically** creates a group account for the user, called a **User Private Group (UPG)**.\
On these systems, the group and username would be the **same**, and the only member of this new group would be the new user.

For distributions that do not create a **UPG**, new users are typically given the `users` group as their primary group.\
Users **must** belong to at least **one** group for use as their primary group.

## Groups

The most common reason to create a group is to provide a way for users to share files.

`/etc/group/`

## Users

User account information is stored in the `/etc/passwd` file and user authentication information (password data) is stored in the `/etc/shadow` file.\
Creating a new user can be accomplished by manually adding a new line to each of these files, but that is generally not the recommended technique.

`/etc/passwd`

`/etc/shadow`

`/etc/default/useradd`

`/etc/login.defs`

```shell
root@localhost:~#  grep -Ev '^#|^$' /etc/login.defs
MAIL_DIR /var/mail/spool
PASS_MAX_DAYS 99999
PASS_MIN_DAYS 0
PASS_MIN_LEN 5
PASS_WARN_AGE 7
UID_MIN     500
UID_MAX   60000
GID_MIN     500
GID_MAX   60000
CREATE_HOME yes
UMASK           077
USERGROUPS_ENAB yes
ENCRYPT_METHOD SHA512
MD5_CRYPT_ENAB no
```

The root user has a **UID of 0**, which allows that account to have special privileges. **Any** account with a **UID of 0** would effectively be able to act as the administrator.

## Permissions

>`-rw-r--r-- 1 root root 4135 May 27 21:08 /etc/passwd`

[File Type](#file-type)

- **Read**: The first character of each group represents the read permission. There is an `r` character if the group has the read permission, or a `-` character if the group does not.
  - On a file, this allows processes to read the contents of the file, meaning the contents can be viewed and copied.
  - On a directory, file names in the directory can be listed, but other details are not available (trying to read, write a file inside).
- **Write**: The second character of each group represents the write permission. There is a `w` character if the group has the write permission, or a `-` character if the group does not.
  - A file can be written to by the process, so changes to a file can be saved.\
Note that `w` permission really requires `r` permission on the file to work correctly.
  - On a directory, files can be added to or removed from the directory.\
Note that `w` permission requires `x` permission on the directory to work correctly.
- **Execute**: The third character of each group represents the execute permission. There is an x character if the group has the execute permission, or a - character if the group does not.
  - A file can be executed or run as a process.
  - On a directory, the user can use the cd command to "get into" the directory and use the directory in a pathname to access files and, potentially, subdirectories under this directory.

```shell
tuana9a@my-first-lxc:/tmp$ ls -l
total 24
-rw-rw-r-- 1 tuana91a tuana91a    1 Sep  4 01:29 tuana91a.txt
drwxrwxr-- 2 tuana9a  tuana9a  4096 Sep  4 01:43 tuana9a
-rw-rw--w- 1 tuana9a  tuana9a    63 Sep  3 03:31 tuana9a.txt
```

```shell
tuana91a@my-first-lxc:/tmp$ ls -l tuana9a
ls: cannot access 'tuana9a/test': Permission denied
total 0
-????????? ? ? ? ?            ? test
tuana91a@my-first-lxc:/tmp$
```

## Default Permissions

|             |           |
| ----------- | --------- |
| file        | rw-rw-rw- |
| directories | rwxrwxrwx |

```shell
sysadmin@localhost:~$ umask
0002
```

A breakdown of the output:

- The first 0 indicates that the umask is given as an octal number.
- The second 0 indicates which permissions to subtract from the default user owner's permissions.
- The third 0 indicates which permissions to subtract from the default group owner's permissions.
- The last number 2 indicates which permissions to subtract from the default other's permissions.

Note that different users may have different umasks. Typically the **root** user has a more restrictive umask than normal user accounts:

```shell
root@localhost:~# umask
0022
```

To understand how umask works, assume that the umask of a file is set to 027 and consider the following:

|              |           |
| ------------ | --------- |
| File Default | &nbsp;666 |
| Umask        | -027      |
| Result       | &nbsp;640 |

The 027 umask means that new files would receive 640 or `rw-r-----` permissions by default, as demonstrated below:

```shell
sysadmin@localhost:~$ umask 027
sysadmin@localhost:~$ touch sample
sysadmin@localhost:~$ ls -l sample
-rw-r-----. 1 sysadmin sysadmin 0 Oct 28 20:14 sample
```

Because the default permissions for directories are different than for files, a umask of 027 would result in different initial permissions on new directories:

|                   |           |
| ----------------- | --------- |
| Directory Default | &nbsp;777 |
| Umask             | -027      |
| Result            | &nbsp;750 |

The 027 umask means that directories files would receive 750 or `rwxr-x---` permissions by default, as demonstrated below:

```shell
sysadmin@localhost:~$ umask 027
sysadmin@localhost:~$ mkdir test-dir
sysadmin@localhost:~$ ls -ld test-dir
drwxr-x---. 1 sysadmin sysadmin 4096 Oct 28 20:25 test-dir
```

The new umask is only applied to file and directories created during that session. When a new shell is started, the default umask will again be in effect.

Permanently changing a user's umask requires modifying the `.bashrc` file located in that user's home directory.

## Special Directories and File

### setuid

When the setuid permission is set on an executable binary file (a program) the binary file is run as the owner of the file, not as the user who executed it.

To add the setuid permission symbolically, run:

```bash
chmod u+s file
```

To add the setuid permission numerically, add 4000 to the file's existing permissions (assume the file originally had 775 for its permission in the following example):

```bash
chmod 4775 file
```

To remove the setuid permission symbolically, run:

```bash
chmod u-s file
```

To remove the setuid permission numerically, subtract 4000 from the file's existing permissions:

```bash
chmod 0775 file
```

### setgid

- The setgid permission on a file is very similar to [setuid](#setuid); it allows a user to run an executable binary file in a manner that provides them additional (temporary) group access.

- When set on a directory, the setgid permission causes files created in the directory to be owned by the group that owns the directory automatically.

Use the following syntax to add the setgid permission symbolically:

```bash
chmod g+s <file|directory>
```

To add the setgid permission numerically, add 2000 to the file's existing permissions (assume in the following example that the directory originally had 775 for its permissions):

```bash
chmod 2775 <file|directory>
```

To remove the setgid permission symbolically, run:

```bash
chmod g-s <file|directory>
```

To remove the setgid permission numerically, subtract 2000 from the file's existing permissions:

```bash
chmod 0775 <file|directory>
```

### sticky bit

The sticky bit permission is used to prevent other users from deleting files that they do not own in a shared directory.

```shell
sysadmin@localhost:~$ ls -ld /tmp
drwxrwxrwt 1 root root 4096 Mar 14  2016 /tmp
```

>A lowercase t means that both the sticky bit and execute permissions are set for others. An uppercase T means that only the sticky bit permission is set.
>While the capital S indicated a problem with the setuid or setgid permissions, a capital T does not necessarily indicate a problem, as long as the group owner still has the execute permission.

To set the sticky bit permission symbolically, execute a command like the following:

```bash
chmod o+t <directory>
```

To set the sticky bit permission numerically, add 1000 to the directory's existing permissions (assume the directory in the following example originally had 775 for its permissions):

```bash
chmod 1775 <file|directory>
```

To remove the sticky permission symbolically, run:

```bash
chmod o-t <directory>
```

‌⁠​​⁠​To remove the sticky bit permission numerically, subtract 1000 from the directory's existing permissions:

```bash
chmod 0775 <directory>
```
