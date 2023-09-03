# nodejs

`package.json` và `package-lock.json` sẽ là thứ giúp quản lí module, nếu chuyển máy tính chỉ cần `npm init` là sẽ tự build các dependency cho mình

các lệnh npm thường dùng

```bash
# mặc định là local
npm install PACKAGE

# cái này sẽ cài global ở AppData của user (window)
npm install PACKAGE -g

# để instal với package-lock.json
npm ci

# xóa một pkg của project
npm uninstall PACKAGE

# liệt kê các pkg đã install trong project
npm ls

# tìm kiếm pkg online
npm search PACKAGE
```
