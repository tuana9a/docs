-- ORDER BY(tên_cột) sắp xếp theo tăng ASC hoặc giảm DESC nếu không có gì thì mặc định là tăng VD:

-- mặc định là tăng dần
SELECT ... WHERE id

-- tăng dần
SELECT ... WHERE id ASC

-- giảm dần
SELECT ... WHERE id DESC
-- <span class="color-red">chú ý</span>: khi sắp xếp 2 cột cùng lúc cột nào gọi trước sẽ được ưu tiên rồi mới đến cột sau

-- nếu giá trị của cột gọi trước bằng nhau thì sẽ sắp tiếp theo cột sau
-- VD: sẽ ưu tiên sắp cust_id trước, nếu cust_id giống thì sắp xếp theo first_name
SELECT * FROM account oder BY cust_id, first_name