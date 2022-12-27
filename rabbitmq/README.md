# rabbitmq

commands

```bash
rabbitmqctl list_queues name messages_ready messages_unacknowledged
```

```bash
rabbitmqctl add_user 'username' 'password'
```

```bash
rabbitmqctl set_permissions -p '/' 'username' '.*' '.*' '.*'
```

```bash
rabbitmqctl add_vhost 'vhostname'
```