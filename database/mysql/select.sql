SELECT (DISTINCT) … FROM … WHERE … GROUP BY … HAVING … ORDER BY … LIMIT …  

-- đưa ra các kết quả không trùng nhau nếu select hai bảng (hoặc hơn) chỉ cần không trùng một trong hai bảng đều sẽ được đưa ra
SELECT DISTINCT
    
-- đưa ra màn hình các kết quả thỏa mãn điều kiện trong where	
SELECT WHERE 
    WHERE có các toán tử:
        >,<,>=,<=,<>(toán tử khác !=)

    BETWEEN value1 value2 tức ở giữa 2 giá trị value1 và value2
        cái này trong lọc giá sản phẩm,lọc video nhiều view,…

    LIKE toán tử chứa VD:
    LIKE('%a%') chứa bao nhiêu ký tự trước và sau a đều được
        LIKE('%a') kết thúc bằng chứ a
        LIKE('a_') bắt đầu bằng chữ a và chỉ có một chữ nữa sau a

    IN(vlaue1,value2,..,valuen) thỏa mãn 1 trong các value
        VD:IN('Hà Nội','Hải Phòng') tức Hà Nội OR Hải Phòng
    
    AND khi có nhiều điều kiện cần thỏa mãn n điều kiện n-1 cái AND
        VD: WHERE ho_ten LIKE 'a%' AND dia_chi='Cổ Bi' tên bắt đầu 'a' và ở Cổ Bi
    
    OR hoặc
        VD: WHERE dia_chi='Cổ Bi' OR dia_chi='Phúc Lợi' Cổ Bi hoặc Phúc Lợi
        VD: <span class="color-red">?</span> WHERE dia_chi='Cổ Bi' OR 'Phúc Lợi' tương đương ở cả Cổ Bi lẫn lúc lợi
    
    NOT tức là nhưng cái không thỏa mãn điều kiện VD:
            WHERE NOT dia_chi='Cổ Bi' AND ho_ten ='Tuấn' tên tuấn nhưng không ở Cổ Bi
            WHERE NOT (dia_chi='Cổ Bi' OR ho_ten ='Tuấn') vừa không ở Cổ Bi vừa tên không phải là Tuấn
    WHERE NOT dia_chi='Cổ Bi' OR ho_ten='Tuấn' không ở Cổ Bi hoặc tên là Tuấn tức Tuấn ở Cổ Bi vẫn lấy được
    WHERE NOT (dia_chi='Cổ Bi' AND ho_ten ='Tuấn') không ở Cổ Bi và không tên là Tuấn tức chỉ loại Tuấn ở Cổ Bi

    ORDER BY(tên_cột) sắp xếp theo tăng ASC hoặc giảm DESC nếu không có gì thì mặc định là tăng VD:
        WHERE id mặc định là tăng dần
        WHERE id ASC tăng dần
        WHERE id DESC giảm dần
        <span class="color-red">chú ý</span>: khi sắp xếp 2 cột cùng lúc cột nào gọi trước sẽ được ưu tiên rồi mới đến cột sau
        nếu giá trị của cột gọi trước bằng nhau thì sẽ sắp tiếp theo cột sau
        VD: SELECT * FROM account oder by cust_id, first_name sẽ ưu tiên sắp cust_id trước, nếu cust_id giống thì sắp xếp theo first_name

    LIMIT giới hạn luôn đặt ở cuối câu lệnh VD:
        LIMIT 5 giới hạn 5 bản ghi
        LIMIT 4,5 giới hạn 5 bản từ bản thứ 5   
        <span class="color-red">chú ý</span>: SELECT … LIMIT n liệt kê ra n phần tử từ phần tử đầu tiên(m=0) và
        LIMIT m,n sẽ thu đc n kết quả từ phần tử m+1

    GROUP BY(tên_cột) nhóm các bản ghi có cùng giá trị của cột đó VD:
        SELECT count(ten_KH) FROM KH GROUP BY dia chi đếm số khách hàng ở cùng một địa chỉ kết quả ra màn hình có dạng
            
            +-----------+---+
            | HCM       | 5 |
            +-----------+---+
            | Hải Phòng | 4 |
            +-----------+---+
            | Hà Nội    | 3 |      	
            +-----------+---+

    SELECT sum(gia_tien),ten_sp FROM san_pham GROUP BY ten_sp sẽ tính tổng tiền của đơn hàng mà tên sản phẩm giống nhau
            having bắt buộc theo sau hàm GROUP BY ? tương tự WHERE


    VD: SELECT * FROM info_hs,diem_toan WHERE(info_hs.id=2000 AND info_hs.id=diem_toan.id) show info và điểm toán của hs có id 2000
        chú ý: ví dụ ngay trên phải có điều kiện hai cái id bằng nhau vì hai cái id này ko liên quan đến nhau và nếu không có sẽ là tích đề các

-- (join lấy phần chung)
INNER JOIN 
    SELECT * FROM tên_bảng1 INNER JOIN tên_bảng2 USING(khóa_chính_chung_2_bảng) WHERE…
        VD: SELECT * FROM info_hs INNER JOIN diem_toan USING(id) WHERE(diem_toan.dai1>=7)
            sẽ trả về nối 2 bảng với khóa chính chung là id cách này chỉ sử dụng khi có khóa chính chung
        VD: SELECT * FROM info_hs INNER JOIN diem_toan USING(id) INNER JOIN dang_ky USING(id)	
        <span class="color-red">chú ý</span> là tương ứng USING là phải theo thứ tự INNER JOIN và kết quả nối bảng cũng theo thứ tự INNER JOIN
    với mỗi một INNER JOIN chỉ có một bảng tham gia thôi chứ không thể có nhiều bảng
    SELECT * FROM tên_bảng1,tên_bảng2 INNER JOIN ON tên_cột.tên_bảng1 = tên_cột.tên_bảng2
        cái này sẽ tiện hơn cái USING vì nó ko cần phải là khóa chính

-- (join lấy tất bảng trái, phần chung, nếu bảng phải ko có thì sẽ là null)
LEFT JOIN   

-- (join lấy tất bảng trái, phần chung, nếu bảng phải ko có thì sẽ là null)
RIGHT JOIN   

-- (join lấy tất bảng trái, bảng phải, phần chung, nếu bảng nào ko có thì sẽ là null)
FULL OUTER JOIN   

UNION và UNION ALL

SELECT 1… UNION SELECT 2…;
    lấy nội dung từ hai bảng nếu trùng nhau thì loại, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết
SELECT 1… UNION ALL SELECT 2…;
    lấy nội dung từ hai bảng lấy cả trùng nhau, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết