# visudo

chỉnh sửa các thứ liên quan tới quền

```bash
sudo visudo
```

content

```ini
%sudo ALL=(ALL:ALL) ALL   # mặc định của ubuntu
%sudo ALL=(ALL:ALL) ALL   # không cần nhập password

# sau đó thêm dòng sau cho user tuana9a bố đời không cần nhập pass khi sudo
tuana9a ALL=(ALL) NOPASSWD:ALL
```
