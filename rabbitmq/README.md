# rabbitmq

```bash
rabbitmqctl list_queues name messages_ready messages_unacknowledged

rabbitmqctl add_user 'username' 'password'

rabbitmqctl add_vhost 'vhostname'

rabbitmqctl set_permissions -p 'some-vhost' 'username' '.*' '.*' '.*'

for name in $(cat to-be-deleted.txt); do rabbitmqctl delete_queue --vhost=some-vhost $name; done
```