# Git Commands

## config

```bash
git config --global user.name YOUR_NAME
```

```bash
git config --global user.email YOUR_EMAIL
```

config việc đấu đá linefeed vs CRLF của window vs linux

```bash
git config --global core.autocrlf true
```

xem các config đã set up

```bash
git config --list
```

git config tên_set_up_muốn_xem

```bash
git config core.editor
```

alias

```bash
git config --global alias.lệnh_rút_gọn 'lệnh_chính_thống'
```

## diff

xem những file đang staged trước khi commit

```bash
git diff -staged
```

## status

xem những file nào chưa add file nào đã add file nào chỉnh sửa mà chưa commit

```bash
git status
```

trả về status dạng ngắn 😲

```bash
git status -s
```

```bash
git status -short
```

## log

xem log đã commit bao gồm tên người gửi, ngày giờ commit, tin nhắn -m của người commit

```bash
git log
```

giới hạn 10

```bash
git log -p -10
```

chỉ show ra màn hình 2 lần commit gần nhất

```bash
git log -p -2
```

xem dạng khác đầy đủ hơn

```bash
git log --stat
```

ấn q để thoát khỏi màn hình log

format đầu ra của log

```bash
git log --pretty=cái_gì_đó
```

show các commit trên một dòng thu gọn còn mỗi message và mã commit

```bash
git log --pretty=oneline
```

```bash
git log --oneline
```

```bash
git log --since
```

```bash
git log --after
```

```bash
git log --before
```

```bash
git log --author
```

```bash
git log --committer
```

```bash
git log --grep
```

## add

add file vào repository hoặc đưa file modified sang trạng thái staged

```bash
git add SOME_PATH
```

```bash
git add test.txt
```

```bash
git add *.txt   # add tất cả các file  .txt
```

```bash
git add --f SOME_PATH   # để thêm file mặc dù đã gitignore
```

add tất cả các file kể cả untracked hay modified vào staged để commit

```bash
git add -A
```

```bash
git add --all
```

## reset

dùng khi vừa add mà ko muốn commit sẽ đưa file thành unstaged

```bash
git reset HEAD SOME_PATH
```

## checkout

undo một file vừa modified và undo cả file trên ổ cứng

```bash
git checkout -- SOME_PATH
```

để switch sang branch mong muốn

```bash
git checkout branch_name
```

rẽ nhánh branch mới từ tag bất kỳ coi như mới toàn bộ

```bash
git checkout -b new_branch_name tên_tag_bất_kỳ
```

## rm & mv

lệnh sau đây checkout này khá nguy hiểm vì ko thể undo lại chính lệnh này

cái này sẽ xóa cả trên ổ cứng và trên repository

```bash
git rm SOME_PATH
```

xóa toàn bộ thư mục và file trong thư mục đó xóa cả ở ổ cứng

```bash
git rm tên_thư_mục_hoặc_đường_dẫn -r
```

cái này chỉ là đưa về trạng thái untracked(unstaged) không xóa trên ổ cứng

```bash
git rm -cached SOME_PATH
```

```bash
git mv
```

đổi tên file hoặc đổi tên thư mục

```bash
git mv tên_file_cũ tên_mới
```

di chuyển file tới thư mục mới

```bash
git mv rm SOME_PATH đường_dẫn_thư_mục
```

chuyển file demo tới thư mục

```bash
git mv demo project0/project1-0
```

## commit

```bash
git commit
```

```bash
git commit -m "tên tin nhẵn muốn truyền đạt"
```

```bash
git commit -m "xong module dò đường"
```

sau khi commit thì quên chưa add một file hay nhiều file thì có thể add lại

và commit trùng với lần commit gần nhất cái này để tránh bị rối khi nhìn các phiên bản

và cái này sẽ là của người dùng đó thôi

```bash
git commit -amend
```

## branch

remote_name là tên của local khi up lên remote repo

xem brach hiện tại đang dùng

```bash
git branch
```

tạo branch mới tương ứng với commit hiện tại (commit gần nhất)

```bash
git branch tên_branch_mới
```

xem tên nhánh mới nhất

```bash
git branch --v
```

để switch sang branch mong muốn

```bash
git checkout branch_name
```

xem nhánh nào đã merged với nhánh hiện tại

```bash
git branch --merged
```

xem nhanh chưa merged với nhánh hiện tại

```bash
git branch --no-merged
```

xóa một nhánh đã merged với nhánh hiện tại, nhánh chưa merged sẽ ko xóa được

```bash
git branch -d branch_name
```

cái này dùng để xóa nhánh chưa merged trong trường hợp đã nói ở trên

```bash
git btanch -D branch_name
```

rẽ nhánh branch mới từ tag bất kỳ coi như mới toàn bộ

```bash
git checkout -b new_branch_name tên_tag_bất_kỳ
```

## push

để up branch lên remote

```bash
git push --set-upstream remote_name tên_nhánh
```

## merge

merge nhánh hiện tại với nhánh mong muốn

(hot fix bug ko thể sửa trực tiếp lên nhánh master được phải tạo nhánh mới để fix)

như vậy sẽ tạo thêm một commit của cả 2 nhánh đồng thời gộp cả 2 commit của cả 2 nhánh

```bash
git merge tên_nhánh_muốn_merge
```

## tag

cái này tag commit và chỉ ở local

```bash
git tag [option] tên_tag [râu_ria]
```

tag bản gần nhất là dạng annotated tag

(dạng chứa nhiều thông tin của tag) với tên tag là ver.1.0

và tin nhắn kèm theo là This is Beta Version

```bash
git tag -a ver.1.0 -m "This is Beta Version"
```

tag bản này dạng lightweight (dạng chỉ có tên tag)

```bash
git tag ver1.0.1
```

để xóa tag ở local repo chứ không xóa trên remote

```bash
git tag -d tên_tag
```

tag đúng commit mình cần mã commit lấy ở git log

mã màu vàng nếu không có mã commit thì mặc định tag tiếp vào commit mới nhất và một commit có thể có nhiều tag

```bash
git tag tên_tag mã_commit
```

xem chi tiết bản tag lần đó tương ứng với lần commit đó

```bash
git show tên_tag
```

push tag lên trên remote repo

```bash
git push remote_name tên_tag
```

để push hết các tag lên trên remote repo

```bash
git push remote_name --tags
```

```bash
git push remote_name --delete tên_tag
```

rẽ nhánh sang branch mới từ tag mong muốn thì coi như bắt đầu lại từ chính cái commit mà tag đó gắn vào

```bash
git checkout -b new_branch_name tên_tag_bất_kỳ
```

## remote

```bash
git remote
```

cái này để xem đường link fetch(kéo dữ liệu về) và push(đẩy dữ liệu lên)

```bash
git remote -v
```

liên kết local repository lên trên mạng để chia sẻ với đồng nghiệp

```bash
git remote add tên_muốn_đặt link_đến_server_git
```

xem info remote,...

```bash
git remote show remote_name
```

đổi tên remote

```bash
git remote rename tên_remote_cũ tên_mới
```

không liên kết repo local ở thư mục hiện tại với repo trên mạng nữa(đổi link rep remote mới chẳng hạn)

```bash
git remote rm tên_remote
```

so sánh dữ liệu với remote

```bash
git fetch [remote_name]
```

kéo về và merge

```bash
git pull [remote_name] [branch_name]
```

đẩy lên remote

```bash
git push [remote_name] [branch_name]
```

thay đổi url remote

```bash
git remote set-url [remote_name] [new_url]
```
