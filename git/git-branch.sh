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

# để up branch lên remote
git push --set-upstream remote_name tên_nhánh   

# merge nhánh hiện tại với nhánh mong muốn
# (hot fix bug ko thể sửa trực tiếp lên nhánh master được phải tạo nhánh mới để fix)
# như vậy sẽ tạo thêm một commit của cả 2 nhánh đồng thời gộp cả 2 commit của cả 2 nhánh
git merge tên_nhánh_muốn_merge   