-- tạo gì đó

create database tên_database tạo database
create database if not exists tên_database tạo database nếu chưa tồn tại
-- <span class="color-red">chú ý</span>: nếu tạo mới database đã tồn tại thì sẽ báo lỗi

create database tên_database default character set utf8
create table tên_table(tên_cột kiểu_dữ_liệu,…) engine 'tên_engine'
-- <span class="color-red">chú ý</span>: nếu dùng auto_increment thì kiểu dữ liệu phải là int (unsigned ?) ko thể là varchar()