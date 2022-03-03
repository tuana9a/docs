-- tạo gì đó

CREATE DATABASE tên_database tạo DATABASE
CREATE DATABASE if not exists tên_database tạo DATABASE nếu chưa tồn tại
-- <span class="color-red">chú ý</span>: nếu tạo mới database đã tồn tại thì sẽ báo lỗi

CREATE DATABASE tên_database DEFAULT CHARACTER SET utf8
CREATE TABLE tên_table(tên_cột kiểu_dữ_liệu,...) ENGINE='tên_engine'
-- <span class="color-red">chú ý</span>: nếu dùng auto_increment thì kiểu dữ liệu phải là int (unsigned ?) ko thể là varchar()