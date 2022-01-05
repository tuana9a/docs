git remote

# cái này để xem đường link fetch(kéo dữ liệu về) và push(đẩy dữ liệu lên)
git remote -v   

# liên kết local repository lên trên mạng để chia sẻ với đồng nghiệp
git remote add tên_muốn_đặt link_đến_server_git

# xem info remote,…
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