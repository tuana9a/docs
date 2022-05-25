# issue python venv in linux

Created: July 17, 2021
Tags: python

### venv trong linux bị ảo khi chạy .sh file

mặc dù đang trong `(venv)` nhưng

```bash
bash install.sh
```

`install.sh` chứa một loạt pip install nhưng pip vẫn install ở ngoài `(venv)`

```bash
pip install -r requirements.txt
```

để chạy được như ý muốn thì cần đặt luôn source venv ở trong `install.sh`

```bash
source .venv/bin/activate
pip install -r requirements.txt
```

nguyên nhân do bash là phần mềm khác nên sẽ không nhận `(venv)` hiện tại