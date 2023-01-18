# Commands

## Create a directory in HDFS at given path(s)

```bash
hadoop fs -mkdir <paths>
```

```bash
hadoop fs -mkdir /user/saurzcode/dir1 /user/saurzcode/dir2
```

## List the contents of a directory

```bash
hadoop fs -ls <args>
```

```bash
hadoop fs -ls /user/saurzcode
```

## Upload and download a file in HDFS

```bash
hadoop fs -put:
```

```bash
# Copy single src file, or multiple src files from local file system to the Hadoop data file system
hadoop fs -put <localsrc> ... <HDFS_dest_Path>
```

```bash
hadoop fs -put /home/saurzcode/Samplefile.txt /user/saurzcode/dir3/
```

```bash
hadoop fs -get <hdfs_src> <localdst>
```

```bash
hadoop fs -get /user/saurzcode/dir3/Samplefile.txt /home/
```

## See contents of a file

```bash
hadoop fs -cat <path[filename]>
```

```bash
hadoop fs -cat /user/saurzcode/dir1/abc.txt
```

## Copy a file from source to destination

```bash
hadoop fs -cp <source> <dest>
```

```bash
hadoop fs -cp /user/saurzcode/dir1/abc.txt /user/saurzcode/dir2
```

## Copy a file from/To Local file system to HDFS

```bash
hadoop fs -copyFromLocal <localsrc> URI
```

```bash
hadoop fs -copyFromLocal /home/saurzcode/abc.txt /user/saurzcode/abc.txt
```

Similar to get command, except that the destination is restricted to a local file reference.

```bash
hadoop fs -copyToLocal [-ignorecrc] [-crc] URI <localdst>
```

## Move file from source to destination

Note:- Moving files across filesystem is not permitted.

```bash
hadoop fs -mv <src> <dest>
```

```bash
hadoop fs -mv /user/saurzcode/dir1/abc.txt /user/saurzcode/dir2
```

## Remove a file or directory in HDFS

```bash
hadoop fs -rm <arg>
```

```bash
hadoop fs -rm /user/saurzcode/dir1/abc.txt
```

Recursive version of delete.

```bash
hadoop fs -rmr <arg>
```

```bash
hadoop fs -rmr /user/saurzcode/
```

## Display last few lines of a file

```bash
hadoop fs -tail <path[filename]>
```

```bash
hadoop fs -tail /user/saurzcode/dir1/abc.txt
```

## Display the aggregate length of a file

```bash
hadoop fs -du <path>
```

```bash
hadoop fs -du /user/saurzcode/dir1/abc.txt
```
