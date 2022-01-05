# cái này tag commit và chỉ ở local
git tag [option] tên_tag [râu_ria]

# tag bản gần nhất là dạng annotated tag
# (dạng chứa nhiều thông tin của tag) với tên tag là ver.1.0
# và tin nhắn kèm theo là This is Beta Version
git tag -a ver.1.0 -m "This is Beta Version"

# tag bản này dạng lightweight (dạng chỉ có tên tag)
git tag ver1.0.1

# để xóa tag ở local repo chứ không xóa trên remote
git tag -d tên_tag

# tag đúng commit mình cần mã commit lấy ở git log
# mã màu vàng nếu không có mã commit thì mặc định tag tiếp vào commit mới nhất và một commit có thể có nhiều tag
git tag tên_tag mã_commit

# xem chi tiết bản tag lần đó tương ứng với lần commit đó
git show tên_tag

# push tag lên trên remote repo
git push remote_name tên_tag

# để push hết các tag lên trên remote repo
git push remote_name --tags
git push remote_name --delete tên_tag

# rẽ nhánh sang branch mới từ tag mong muốn thì coi như bắt đầu lại từ chính cái commit mà tag đó gắn vào
git checkout -b new_branch_name tên_tag_bất_kỳ