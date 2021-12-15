info replication

info persistence

ls -la --time-style=full-iso

cd /var/lib/redis/

redis-server /etc/redis/redis.conf

auth rXNYq+tpWo6u8i1MVYB42FnW4BmJ5rIisn/fPWv6a1RskK27n6mE16IKA078O+Vz

cat commands.txt | redis-cli --pipe -a rXNYq+tpWo6u8i1MVYB42FnW4BmJ5rIisn/fPWv6a1RskK27n6mE16IKA078O+Vz

docker run -p 6379:6379 -v /etc/redis/redis.conf:/etc/redis/redis.conf --name redis redis:5.0 redis-server /etc/redis/redis.conf
docker run -p 6379:6379 --name redis redis:5.0

# create cluster
redis-cli --cluster create \
127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 \
127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 \
--cluster-replicas 0

redis-cli --cluster create \
127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 \
--cluster-replicas 0


# check status cluster
redis-cli --cluster check 127.0.0.1:7000

# reshard cluster
redis-cli --cluster reshard 127.0.0.1:7000 \
--cluster-from fb040bdf36cd3f1e9c2bfbbcd6c352a4450fcee7 \
--cluster-to 3890bbf52831cc5ff076ad855429f044705c67ce \
--cluster-slots 3000 \
--cluster-yes

redis-cli --cluster reshard 127.0.0.1:7000 \
--cluster-from 3f4cbf67cb5f9c65ce9803d2ac827dbe6190e4af 3890bbf52831cc5ff076ad855429f044705c67ce \
--cluster-to fb040bdf36cd3f1e9c2bfbbcd6c352a4450fcee7 \
--cluster-slots 2000 \
--cluster-yes

# add member
redis-cli --cluster add-node 127.0.0.1:7003 127.0.0.1:7000

redis-cli --cluster add-node 127.0.0.1:7003 127.0.0.1:7000 --cluster-slave

redis-cli --cluster del-node 127.0.0.1:7004 05f7ea0c8aa5ff0db31a3952f19aaf62a0ce8405
redis-cli --cluster del-node 127.0.0.1:7000 16920260897b9731e4f81eee538763f55c8c8db4

scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node0/redis.conf
scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node1/redis.conf
scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node2/redis.conf
scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node3/redis.conf
scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node4/redis.conf
scp redis/cluster.conf root@vm1.bizflycloud.tuana9a.tech:/root/redis-cluster-test/node5/redis.conf
