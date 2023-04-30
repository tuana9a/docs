# export

set env variable

```bash
export tuan=deptrai
echo $tuan # deptrai
```

```bash
# set env from .env file
export $(grep -v '^#' .env | xargs)
```
