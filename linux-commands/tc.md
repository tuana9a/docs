# tc

net emulator

**chú ý**: lệnh đầu cần add dev (card mạng) các lệnh sau chỉ cần update lại đống này

delay

```bash
sudo tc qdisc add dev ens38 root netem delay 100ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms 10ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms 10ms 25%
```

## packet loss

```bash
sudo tc qdisc change dev ens38 root netem loss 0.1%
```

```bash
sudo tc qdisc change dev ens38 root netem loss 0.3% 25%
```

```bash
sudo tc qdisc change dev ens38 root netem loss 20% 25%
```

## duplicate

```bash
sudo tc qdisc change dev ens38 root netem duplicate 40%
```

## corrupt

```bash
sudo tc qdisc change dev ens38 root netem corrupt 40%
```

## reorder

```bash
sudo tc qdisc change dev ens38 root netem reorder 5% gap 5 delay 10ms
```

## reset

khi xong rồi để hủy các giả lập trước đó chỉ cần remove chúng khỏi emulator

```bash
sudo tc qdisc del dev ens38 root
```
