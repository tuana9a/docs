# Fn key rows not work in ubuntu (linux in general)

edit `/etc/modprobe.d/hid_apple.conf`

add

```conf
options hid_apple fnmode=2
```

```bash
sudo update-initramfs -u && reboot
```

# Refs

[https://github.com/Kurgol/keychron/blob/master/k2.md#f-keys-on-ubuntu](https://github.com/Kurgol/keychron/blob/master/k2.md#f-keys-on-ubuntu)

[https://www.reddit.com/r/Keychron/comments/lgotvh/keychron_k3_ubuntu_fn_keys/](https://www.reddit.com/r/Keychron/comments/lgotvh/keychron_k3_ubuntu_fn_keys/)

