# how to

## how to locate installed deb package

```bash
dpkg -L package-name
```

refs [https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation](https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installationhttps://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation)

## get current ip of ubuntu

```bash
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

```bash
ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

## how to generate password

`$1` is param for length of password

```bash
date +%s | sha256sum | base64 | head -c $1 ; echo
```

```bash
openssl rand -base64 $1
```
