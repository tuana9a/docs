# Linux commands

## CAUTIONS

Trong terminal dấu or ký tự "\*" trong câu lệnh Ubuntu cần thêm "\" trước nó tức "\*" nếu không muốn bị hiểu thành tất cả file trong cái thư mục đó

## Bash load .env file

```bash
export $(grep -v '^#' .env | xargs)
```

## Refs

[NetworkChuck - 60 Linux Commands you NEED to know (in 10 minutes)](https://www.youtube.com/watch?v=gd7BXuUQ91w)
