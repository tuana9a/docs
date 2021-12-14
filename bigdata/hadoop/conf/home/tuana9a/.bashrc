# tuana9a add java path
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 #ubuntu
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk   #fedora
export PATH=$PATH:$JAVA_HOME/bin

# tuana9a add hadoop path
export HADOOP_HOME=/opt/hadoop-3.2.2
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# tuana9a add spark path
export SPARK_HOME=/opt/spark-3.1.1-bin-hadoop3.2
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
			