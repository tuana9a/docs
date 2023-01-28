# grub

```bash
grub> ls
```

(hd0) (hd0,gpt1) (hd1) (hd1,gpt2) (hd1,gpt1) (cd0)

```bash
grub> set root=(hd0,gpt1)
```

```bash
grub> chainloader /efi/boot/grubx64.efi
```

```bash
grub> boot
```
