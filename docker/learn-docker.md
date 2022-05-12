# docker command

see [here](./docker-commands.md)

# python client

```python
# /usr/bin/python
import os
import sys
import docker

docker_client = docker.from_env()

def volume_prune():
    docker_client.volumes.prune()


def list_volume_id():
    for volume in docker_client.volumes.list():
        id = volume.id
        print(volume, id)


option = {
    "volume": {
        "list": list_volume_id,
        "prune": volume_prune
    }
}


def main():
    option[sys. argv[1]][sys.argv[2]]()
    pass


main()
```