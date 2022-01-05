# add file vào repository hoặc đưa file modified sang trạng thái staged
git add SOME_PATH

# VD:
git add test.txt
git add *.txt   # add tất cả các file  .txt
git add --f SOME_PATH   # để thêm file mặc dù đã gitignore

# add tất cả các file kể cả untracked hay modified vào staged để commit
git add -A 
git add --all

# dùng khi vừa add mà ko muốn commit sẽ đưa file thành unstaged
git reset HEAD SOME_PATH

# undo một file vừa modified và undo cả file trên ổ cứng
git checkout -- SOME_PATH
		
# lệnh sau đây checkout này khá nguy hiểm vì ko thể undo lại chính lệnh này
git rm SOME_PATH            # cái này sẽ xóa cả trên ổ cứng và trên repository
git rm tên_thư_mục_hoặc_đường_dẫn -r   # xóa toàn bộ thư mục và file trong thư mục đó xóa cả ở ổ cứng
git rm -cached SOME_PATH    # cái này chỉ là đưa về trạng thái untracked(unstaged) không xóa trên ổ cứng
	
git mv
git mv tên_file_cũ tên_mới  # đổi tên file hoặc đổi tên thư mục
git mv rm SOME_PATH đường_dẫn_thư_mục   # di chuyển file tới thư mục mới

#VD:
git mv demo project0/project1-0   chuyển file demo tới thư mục

git commit
git commit -m "tên tin nhẵn muốn truyền đạt"

#VD:
git commit -m "xong module dò đường"

# sau khi commit thì quên chưa add một file hay nhiều file thì có thể add lại và commit trùng với lần commit gần nhất cái này để tránh bị rối khi nhìn các phiên bản và cái này sẽ là của người dùng đó thôi
git commit -amend
	
    
