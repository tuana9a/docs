# mở editor để edit file này :V
crontab -e				

# sau đó sửa theo format sau
# m h dom mon dow command
# VD:
*/15 * * * * /bin/bash /home/tuana9a/write-public-ip.sh

# save file lại và restart cronjob

# ubuntu
systemctl restart cron

# fedora
systemctl restart crond