# 1. Create a directory in HDFS at given path(s).

```bash
hadoop fs -mkdir <paths>
hadoop fs -mkdir /user/saurzcode/dir1 /user/saurzcode/dir2
```

# 2. List the contents of a directory.

```bash
hadoop fs -ls <args>
hadoop fs -ls /user/saurzcode
```

# 3. Upload and download a file in HDFS.

```bash
hadoop fs -put:

# Copy single src file, or multiple src files from local file system to the Hadoop data file system
hadoop fs -put <localsrc> ... <HDFS_dest_Path>
hadoop fs -put /home/saurzcode/Samplefile.txt /user/saurzcode/dir3/

hadoop fs -get:
hadoop fs -get <hdfs_src> <localdst>
hadoop fs -get /user/saurzcode/dir3/Samplefile.txt /home/
```

# 4. See contents of a file

```bash
hadoop fs -cat <path[filename]>
hadoop fs -cat /user/saurzcode/dir1/abc.txt
```

# 5. Copy a file from source to destination

```bash
hadoop fs -cp <source> <dest>
hadoop fs -cp /user/saurzcode/dir1/abc.txt /user/saurzcode/dir2
```

# 6. Copy a file from/To Local file system to HDFS

```bash
hadoop fs -copyFromLocal <localsrc> URI
hadoop fs -copyFromLocal /home/saurzcode/abc.txt /user/saurzcode/abc.txt

hadoop fs -copyToLocal [-ignorecrc] [-crc] URI <localdst>
# Similar to get command,
# except that the destination is restricted to a local file reference.
```

# 7. Move file from source to destination.

```bash
# Note:- Moving files across filesystem is not permitted.
hadoop fs -mv <src> <dest>
hadoop fs -mv /user/saurzcode/dir1/abc.txt /user/saurzcode/dir2
```

# 8. Remove a file or directory in HDFS.

```bash
hadoop fs -rm <arg>
hadoop fs -rm /user/saurzcode/dir1/abc.txt

# Recursive version of delete.
hadoop fs -rmr <arg>
hadoop fs -rmr /user/saurzcode/
```

# 9. Display last few lines of a file.

```bash
hadoop fs -tail <path[filename]>
hadoop fs -tail /user/saurzcode/dir1/abc.txt
```

# 10. Display the aggregate length of a file.

```bash
hadoop fs -du <path>
hadoop fs -du /user/saurzcode/dir1/abc.txt
```
