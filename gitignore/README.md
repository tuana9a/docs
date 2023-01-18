# .gitignore

.gitignore chứa các tên file bạn không muốn add hoặc commit

VD:

```gitignore
# bỏ qua tất cả file .txt ở mọi thư mục kể cả thư mục con
*.txt

# bỏ qua tất cả file hoặc thư mục mà có tên project0 ở bất kỳ chỗ nào
project0

# bỏ qua thư mục project0 ở bất kỳ đâu
project0/

# bỏ qua tất cả file trong bất kỳ thư mục project0(thư mục con của bất kỳ thư mục mẹ nào)
**/project0/

# dấu ** tượng trưng cho một hoặc nhiều thư mục
logs/**/debug.log

# để add file đặc biệt mặc dù thư mục cha ignore
logs/
!logs/important.log
```
