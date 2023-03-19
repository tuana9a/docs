# rabbitmq

commands

```bash
rabbitmqctl list_queues name messages_ready messages_unacknowledged
```

```bash
rabbitmqctl add_user 'username' 'password'
```

```bash
rabbitmqctl add_vhost 'vhostname'
```

```bash
rabbitmqctl set_permissions -p 'some-vhost' 'username' '.*' '.*' '.*'
```

```bash
for name in $(cat to-be-deleted.txt); do rabbitmqctl delete_queue --vhost=some-vhost $name; done
```

```bash
for v in $(rabbitmqctl list_vhosts --silent); do rabbitmqctl set_permissions -p $v "a-user" ".*" ".*" ".*"; done
```
