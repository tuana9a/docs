# 1. `/etc/hosts`

sửa host file trên tất cả các node

# 2. `/home/$USER/.ssh/authorized_keys`

add public keys của toàn bộ node đôi một

# 3. `/home/$USER/.bashrc`

```bash
# tuana9a

# ubuntu
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# or fedora
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

export PATH=$PATH:$JAVA_HOME/bin

# tuana9a add hadoop path
export HADOOP_HOME=/opt/hadoop-3.2.2
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# tuana9a add spark path
export SPARK_HOME=/opt/spark-3.1.1-bin-hadoop3.2
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
```

# #lưu ý

-   phải đảm bảo rằng các node có thể connect lẫn nhau mà
    <b style="color: red;">KHÔNG</b> cần nhập password (password less)

-   cách cài, dùng máy host là linux (máy laptop) làm master,
    các slave được cài trên máy ảo và network mode là NAT

    -   network này không cho phép slave có thể kết nối tới master
    -   do vậy cần chuyển network mode sang host-only
        hoặc các loại network khác
