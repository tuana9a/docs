# gnupg

## maven how to fix `gpg: signing failed: Inappropriate ioctl for device`

edit `~/.gnupg/gpg.conf`

```conf
pinentry-mode loopback
```
