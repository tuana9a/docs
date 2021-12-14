# copy ssh public key
ssh-copy-id tuana9a@hadoop-master.local
ssh-copy-id tuana9a@hadoop-slave-00-01.local
ssh-copy-id tuana9a@hadoop-slave-00-02.local
ssh-copy-id tuana9a@hadoop-slave-00-03.local


# reset all cluster
rm -r /opt/hadoop-3.2.2/hdfs/datanode
rm -r /opt/hadoop-3.2.2/hdfs/namenode


# copy install to each node
scp \
/opt/hadoop-3.2.2/etc/hadoop/*.xml \
/opt/hadoop-3.2.2/etc/hadoop/workers \
tuana9a@hadoop-master.local:/opt/hadoop-3.2.2/etc/hadoop/
echo ========================
scp \
/opt/hadoop-3.2.2/etc/hadoop/* \
tuana9a@hadoop-slave-00-01.local:/opt/hadoop-3.2.2/etc/hadoop/
echo ========================
scp \
/opt/hadoop-3.2.2/etc/hadoop/* \
tuana9a@hadoop-slave-00-02.local:/opt/hadoop-3.2.2/etc/hadoop/
echo =========================
scp \
/opt/hadoop-3.2.2/etc/hadoop/* \
tuana9a@hadoop-slave-00-03.local:/opt/hadoop-3.2.2/etc/hadoop/
