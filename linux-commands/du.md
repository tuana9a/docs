# du

(disk usage)

xem thong tin kich thuoc file

lệnh này sẽ show toàn bộ file recursively nên khó lấy thông tin

```bash
du -h ~
```

thêm `--max-depth 1` sẽ tính tổng theo folder 1 cấp, thông tin như này hữu ích hơn

```bash
du -h --max-depth 1 /home/tuana9a
```

tips sử dụng cờ -s (summary)

```bash
du -sh ~
```

tính tổng disk usage của list filepath

```bash
du -shc ~ /bin # total usage of home dir and /bin
```

## Related

[df](./df.md) [ncdu](./ncdu.md)
