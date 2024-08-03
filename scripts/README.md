# scripts

# tar

```bash
sudo tar \
--exclude='.venv' \
--exclude='node_modules' \
--exclude='.git' \
--exclude='build' \
--exclude='dist' \
--exclude='target' \
--exclude='.vagrant' \
--exclude='__pycache__' \
--exclude='.angular' \
-cvzf github.com.tar.gz github.com
```

# rsync

backup

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
--exclude='.angular' \
/home/tuana9a/Projects /media/tuana9a/BACKUP/Projects
```

restore

```bash
rsync -av /media/tuana9a/BACKUP/Projects /home/tuana9a/
```
