# chú ý lệnh đầu cần add dev (card mạng) các lệnh sau chỉ cần update lại đống này

     
# delay
sudo tc qdisc add dev ens38 root netem delay 100ms

sudo tc qdisc change dev ens38 root netem delay 100ms

sudo tc qdisc change dev ens38 root netem delay 100ms 10ms

sudo tc qdisc change dev ens38 root netem delay 100ms 10ms 25%

    
# packet loss
sudo tc qdisc change dev ens38 root netem loss 0.1%

sudo tc qdisc change dev ens38 root netem loss 0.3% 25%

sudo tc qdisc change dev ens38 root netem loss 20% 25%

        
# other
sudo tc qdisc change dev ens38 root netem duplicate 40%

sudo tc qdisc change dev ens38 root netem corrupt 40%

sudo tc qdisc change dev ens38 root netem reorder 5% gap 5 delay 10ms

# khi xong rồi để hủy các giả lập trước đó chỉ cần remove chúng khỏi emulator
sudo tc qdisc del dev ens38 root