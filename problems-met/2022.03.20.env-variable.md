# env variable

Created: March 20, 2022
Tags: linux

env thì đừng có cho dấu nháy đơn hay nháy kép vào nó có thể break logic

```bash
# cái này thì chạy ngon
PORT=80 ADDRESS=0.0.0.0 ROOT_DIR='./cloud' java -jar docs-1.0.0.jar
```

với file .env

```bash
# file .env
PORT=80
ADDRESS=0.0.0.0
ROOT_DIR="./cloud" # cái này khi vào chương trình nó đọc thành ""./cloud""
# nói chung là env thì cứ chơi "trần" đừng cho chỗi string vào có khi toang
```