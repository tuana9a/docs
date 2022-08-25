# setup max memory

```bash
sysctl -w vm.max_map_count=262144
```

or permanent in file `/etc/sysctl.conf`

add this content `vm.max_map_count=262144`

# max memory of jvm heap

config file **must** under `jvm.options.d` and has `.options` extension

`/etc/elasticsearch/jvm.options.d/default.options`

```
-Xms2g
-Xmx2g
```

# Refs

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/heap-size.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.17/modules-network.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/settings.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/security-settings.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/discovery-settings.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/modules-discovery-hosts-providers.html

https://www.elastic.co/guide/en/elasticsearch/reference/7.9/modules-discovery-bootstrap-cluster.html

https://www.elastic.co/guide/en/x-pack/current/setting-up-authentication.html

