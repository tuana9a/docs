import time
import random
from rediscluster import RedisCluster

startup_nodes = [{"host": "123.30.48.37", "port": "7000"},
                 {"host": "123.30.48.37", "port": "7001"}]

password = "rXNYq+tpWo6u8i1MVYB42FnW4BmJ5rIisn/fPWv6a1RskK27n6mE16IKA078O+Vz"
# connect to a list master
rc = RedisCluster(startup_nodes=startup_nodes,
                  decode_responses=True)
                #   decode_responses=True, password=password)

# connect to a single master like normal redis
# rc = RedisCluster(host="127.0.0.1", port=7000, decode_responses=True)

v = rc.get(str("tuan"))
print(v)
rc.close()
