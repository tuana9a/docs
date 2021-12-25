# xem toàn bộ list wifi
netsh wlan show profiles

# xem passwifi với wifi-name là tên wifi bạn muốn xem
netsh wlan show profile name="wifi-name" key=clear

# ps: toàn bộ lệnh trên đều có thể dùng với cmd