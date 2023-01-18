# cronjob

mở editor để edit file này :V

```bash
crontab -e
```

tips [crontab.guru](https://crontab.guru/)

```conf
# m  h dom mon dow command
*/15 * *   *   *   /bin/bash /home/tuana9a/backup.sh
```

save file lại và restart cronjob

```bash
systemctl restart cron
```

or

```bash
systemctl restart crond
```
