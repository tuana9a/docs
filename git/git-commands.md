# config

```bash
git config --global user.name YOUR_NAME
git config --global user.email YOUR_EMAIL

# config việc đấu đá linefeed vs CRLF của window vs linux
git config --global core.autocrlf true

# xem các config đã set up
git config --list

# git config tên_set_up_muốn_xem
# VD:
git config core.editor

# Alias
git config --global alias.lệnh_rút_gọn 'lệnh_chính_thống'

```

# diff

```bash
# xem những file đang staged trước khi commit
git diff -staged
```

# status

```bash
# xem những file nào chưa add file nào đã add file nào chỉnh sửa mà chưa commit
git status

# trả về status dạng ngắn 😲
git status -s
git status -short
```

# log

```bash
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
```

# add

```bash
# add file vào repository hoặc đưa file modified sang trạng thái staged
git add SOME_PATH

# VD:
git add test.txt
git add *.txt   # add tất cả các file  .txt
git add --f SOME_PATH   # để thêm file mặc dù đã gitignore

# add tất cả các file kể cả untracked hay modified vào staged để commit
git add -A
git add --all

```

# reset

```bash
# dùng khi vừa add mà ko muốn commit sẽ đưa file thành unstaged
git reset HEAD SOME_PATH
```

# checkout

```bash
# undo một file vừa modified và undo cả file trên ổ cứng
git checkout -- SOME_PATH

# để switch sang branch mong muốn
git checkout branch_name

# rẽ nhánh branch mới từ tag bất kỳ coi như mới toàn bộ
git checkout -b new_branch_name tên_tag_bất_kỳ
```

# rm & mv

```bash
# lệnh sau đây checkout này khá nguy hiểm vì ko thể undo lại chính lệnh này
git rm SOME_PATH            # cái này sẽ xóa cả trên ổ cứng và trên repository
git rm tên_thư_mục_hoặc_đường_dẫn -r   # xóa toàn bộ thư mục và file trong thư mục đó xóa cả ở ổ cứng
git rm -cached SOME_PATH    # cái này chỉ là đưa về trạng thái untracked(unstaged) không xóa trên ổ cứng

git mv
git mv tên_file_cũ tên_mới  # đổi tên file hoặc đổi tên thư mục
git mv rm SOME_PATH đường_dẫn_thư_mục   # di chuyển file tới thư mục mới

#VD:
git mv demo project0/project1-0   chuyển file demo tới thư mục
```

# commit

```bash
git commit
git commit -m "tên tin nhẵn muốn truyền đạt"

#VD:
git commit -m "xong module dò đường"

# sau khi commit thì quên chưa add một file hay nhiều file thì có thể add lại và commit trùng với lần commit gần nhất cái này để tránh bị rối khi nhìn các phiên bản và cái này sẽ là của người dùng đó thôi
git commit -amend
```

# branch

```bash
# remote_name là tên của local khi up lên remote repo

# xem brach hiện tại đang dùng
git branch

# tạo branch mới tương ứng với commit hiện tại (commit gần nhất)
git branch tên_branch_mới

# xem tên nhánh mới nhất
git branch --v

# để switch sang branch mong muốn
git checkout branch_name

# xem nhánh nào đã merged với nhánh hiện tại
git branch --merged

# xem nhanh chưa merged với nhánh hiện tại
git branch --no-merged

# xóa một nhánh đã merged với nhánh hiện tại, nhánh chưa merged sẽ ko xóa được
git branch -d branch_name

# cái này dùng để xóa nhánh chưa merged trong trường hợp đã nói ở trên
git btanch -D branch_name

# rẽ nhánh branch mới từ tag bất kỳ coi như mới toàn bộ
git checkout -b new_branch_name tên_tag_bất_kỳ
```

# push

```bash
# để up branch lên remote
git push --set-upstream remote_name tên_nhánh
```

# merge

```bash
# merge nhánh hiện tại với nhánh mong muốn
# (hot fix bug ko thể sửa trực tiếp lên nhánh master được phải tạo nhánh mới để fix)
# như vậy sẽ tạo thêm một commit của cả 2 nhánh đồng thời gộp cả 2 commit của cả 2 nhánh
git merge tên_nhánh_muốn_merge
```

# tag

```bash
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
```

# remote

```bash
git remote

# cái này để xem đường link fetch(kéo dữ liệu về) và push(đẩy dữ liệu lên)
git remote -v

# liên kết local repository lên trên mạng để chia sẻ với đồng nghiệp
git remote add tên_muốn_đặt link_đến_server_git

# xem info remote,...
git remote show remote_name

# đổi tên remote
git remote rename tên_remote_cũ tên_mới

# không liên kết repo local ở thư mục hiện tại với repo trên mạng nữa(đổi link rep remote mới chẳng hạn)
git remote rm tên_remote

# so sánh dữ liệu với remote
git fetch [remote_name]

# kéo về và merge
git pull [remote_name] [branch_name]

# đẩy lên remote
git push [remote_name] [branch_name]
```
