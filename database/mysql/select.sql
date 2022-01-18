SELECT (DISTINCT) … FROM … WHERE … GROUPBY … HAVING … ODERBY … LIMIT …  

-- đưa ra các kết quả không trùng nhau nếu select hai bảng (hoặc hơn) chỉ cần không trùng một trong hai bảng đều sẽ được đưa ra
select distinct
    
-- đưa ra màn hình các kết quả thỏa mãn điều kiện trong where	
select where 
    where có các toán tử:
        >,<,>=,<=,<>(toán tử khác !=)

    between value1 value 2 tức ở giữa 2 giá trị value1 và value2
        cái này trong lọc giá sản phẩm,lọc video nhiều view,…

    like toán tử chứa VD:
    like('%a%') chứa bao nhiêu ký tự trước và sau a đều được
        like('%a') kết thúc bằng chứ a
        like('a_') bắt đầu bằng chữ a và chỉ có một chữ nữa sau a

    in(vlaue1,value2,..,valuen) thỏa mãn 1 trong các value
        VD:in('Hà Nội','Hải Phòng') tức Hà Nội or Hải Phòng
    
    and khi có nhiều điều kiện cần thỏa mãn n điều kiện n-1 cái and
        VD: where ho_ten like 'a%' and dia_chi='Cổ Bi' tên bắt đầu 'a' và ở Cổ Bi
    
    or hoặc
        VD: where dia_chi='Cổ Bi' or dia_chi='Phúc Lợi' Cổ Bi hoặc Phúc Lợi
        VD: <span class="color-red">?</span> where dia_chi='Cổ Bi' or 'Phúc Lợi' tương đương ở cả Cổ Bi lẫn lúc lợi
    
    not tức là nhưng cái không thỏa mãn điều kiện VD:
            where not dia_chi='Cổ Bi' and ho_ten ='Tuấn' tên tuấn nhưng không ở Cổ Bi
            where not (dia_chi='Cổ Bi' or ho_ten ='Tuấn') vừa không ở Cổ Bi vừa tên không phải là Tuấn
    where not dia_chi='Cổ Bi' or ho_ten='Tuấn' không ở Cổ Bi hoặc tên là Tuấn tức Tuấn ở Cổ Bi vẫn lấy được
    where not (dia_chi='Cổ Bi' and ho_ten ='Tuấn') không ở Cổ Bi và không tên là Tuấn tức chỉ loại Tuấn ở Cổ Bi

    oder by(tên_cột) sắp xếp theo tăng asc hoặc giảm desc nếu không có gì thì mặc định là tăng VD:
        where id mặc định là tăng dần
        where id asc tăng dần
        where id desc giảm dần
        <span class="color-red">chú ý</span>: khi sắp xếp 2 cột cùng lúc cột nào gọi trước sẽ được ưu tiên rồi mới đến cột sau
        nếu giá trị của cột gọi trước bằng nhau thì sẽ sắp tiếp theo cột sau
        VD: select * from account oder by cust_id, first_name sẽ ưu tiên sắp cust_id trước, nếu cust_id giống thì sắp xếp theo first_name

    limit giới hạn luôn đặt ở cuối câu lệnh VD:
        limit 5 giới hạn 5 bản ghi
        limit 4,5 giới hạn 5 bản từ bản thứ 5   
        <span class="color-red">chú ý</span>: select … limit n liệt kê ra n phần tử từ phần tử đầu tiên(m=0) và
        limit m,n sẽ thu đc n kết quả từ phần tử m+1

    group by(tên_cột) nhóm các bản ghi có cùng giá trị của cột đó VD:
        select count(ten_KH) from KH group by dia chi đếm số khách hàng ở cùng một địa chỉ kết quả ra màn hình có dạng
            
            +-----------+---+
            | HCM       | 5 |
            +-----------+---+
            | Hải Phòng | 4 |
            +-----------+---+
            | Hà Nội    | 3 |      	
            +-----------+---+

    select sum(gia_tien),ten_sp from san_pham group by ten_sp sẽ tính tổng tiền của đơn hàng mà tên sản phẩm giống nhau
            having bắt buộc theo sau hàm group by ? tương tự where


    VD: select * from info_hs,diem_toan where(info_hs.id=2000 and info_hs.id=diem_toan.id) show info và điểm toán của hs có id 2000
        chú ý: ví dụ ngay trên phải có điều kiện hai cái id bằng nhau vì hai cái id này ko liên quan đến nhau và nếu không có sẽ là tích đề các

-- (join lấy phần chung)
INNER JOIN 
    select * from tên_bảng1 inner join tên_bảng2 using(khóa_chính_chung_2_bảng) where…
        VD: select * from info_hs inner join diem_toan using(id) where(diem_toan.dai1>=7)
            sẽ trả về nối 2 bảng với khóa chính chung là id cách này chỉ sử dụng khi có khóa chính chung
        VD: select * from info_hs inner join diem_toan using(id) inner join dang_ky using(id)	
        <span class="color-red">chú ý</span> là tương ứng using là phải theo thứ tự inner join và kết quả nối bảng cũng theo thứ tự inner join
    với mỗi một inner join chỉ có một bảng tham gia thôi chứ không thể có nhiều bảng
    select * from tên_bảng1,tên_bảng2 inner join on tên_cột.tên_bảng1 = tên_cột.tên_bảng2
        cái này sẽ tiện hơn cái using vì nó ko cần phải là khóa chính

-- (join lấy tất bảng trái, phần chung, nếu bảng phải ko có thì sẽ là null)
LEFT JOIN   

-- (join lấy tất bảng trái, phần chung, nếu bảng phải ko có thì sẽ là null)
RIGHT JOIN   

-- (join lấy tất bảng trái, bảng phải, phần chung, nếu bảng nào ko có thì sẽ là null)
FULL OUTER JOIN   

UNION và UNION ALL

select1… union select2…;
    lấy nội dung từ hai bảng nếu trùng nhau thì loại, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết
select1… union all select2…;
    lấy nội dung từ hai bảng lấy cả trùng nhau, nếu bảng này có bảng kia ko thì bảng ko sẽ null hết