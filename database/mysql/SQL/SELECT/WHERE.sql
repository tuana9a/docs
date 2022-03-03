-- đưa ra màn hình các kết quả thỏa mãn điều kiện trong where	
WHERE
-- có các toán tử:
--   >      lớn hơn 
--   <      nhỏ hơn 
--   >=     lớn hơn hoặc bằng 
--   <=     nhỏ hơn hoặc bằng
--   <>     khác (giống != trong lập trình)
        

BETWEEN value1 value2
-- ở giữa 2 giá trị value1 và value2
-- cái này trong lọc giá sản phẩm,lọc video nhiều view,...

-- toán tử chứa
LIKE
-- VD:
LIKE('%a%') -- chứa bao nhiêu ký tự trước và sau a đều được
LIKE('%a') -- kết thúc bằng chứ a
LIKE('a_') -- bắt đầu bằng chữ a và chỉ có một chữ nữa sau a

-- thỏa mãn 1 trong các value
IN(vlaue1,value2,..,valuen)
-- VD:
IN('Hà Nội','Hải Phòng') -- tức Hà Nội OR Hải Phòng
    
-- khi có nhiều điều kiện cần thỏa mãn n điều kiện n-1 cái AND
AND
-- VD:
WHERE ho_ten LIKE 'a%' AND dia_chi='Cổ Bi' -- tên bắt đầu 'a' và ở Cổ Bi
    
-- hoặc
OR
--VD:
WHERE dia_chi='Cổ Bi' OR dia_chi='Phúc Lợi' -- Cổ Bi hoặc Phúc Lợi
-- VD: <span class="color-red">?</span>
WHERE dia_chi='Cổ Bi' OR 'Phúc Lợi' -- tương đương ở cả Cổ Bi lẫn lúc lợi
    
-- tức là nhưng cái không thỏa mãn điều kiện VD:
NOT
WHERE NOT dia_chi='Cổ Bi' AND ho_ten ='Tuấn' -- tên tuấn nhưng không ở Cổ Bi
WHERE NOT (dia_chi='Cổ Bi' OR ho_ten ='Tuấn') -- vừa không ở Cổ Bi vừa tên không phải là Tuấn
WHERE NOT dia_chi='Cổ Bi' OR ho_ten='Tuấn' -- không ở Cổ Bi hoặc tên là Tuấn tức Tuấn ở Cổ Bi vẫn lấy được
WHERE NOT (dia_chi='Cổ Bi' AND ho_ten ='Tuấn') -- không ở Cổ Bi và không tên là Tuấn tức chỉ loại Tuấn ở Cổ Bi