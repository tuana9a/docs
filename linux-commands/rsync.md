# rsync

dry run `-n` flag

remove `-n` flag to real run

```bash
rsync -nav \
--exclude='.venv' \
--exclude='node_modules' \
--exclude='.git' \
--exclude='build' \
--exclude='dist' \
--exclude='target' \
--exclude='.vagrant' \
--exclude='__pycache__' \
--exclude='infrastructure-as-code' \
--exclude='.angular' \
/home/tuana9a/Projects /media/tuana9a/BACKUP/Projects
```
