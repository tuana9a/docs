# xem những file đang staged trước khi commit
git diff -staged

# xem những file nào chưa add file nào đã add file nào chỉnh sửa mà chưa commit
git status

# trả về status dạng ngắn 😲
git status -s   
git status -short

# xem log đã commit bao gồm tên người gửi, ngày giờ commit, tin nhắn -m của người commit
git log       
git log -p -10  # giới hạn 10 
git log -p -2   # chỉ show ra màn hình 2 lần commit gần nhất
git log --stat  # xem dạng khác đầy đủ hơn
# ấn q để thoát khỏi màn hình log

# format đầu ra của log
git log --pretty=cái_gì_đó
# VD:

# show các commit trên một dòng thu gọn còn mỗi message và mã commit
git log --pretty=oneline
git log --oneline
git log --since
git log --after
git log --before
git log --author
git log --committer
git log --grep
