// HÀM FUNCTION

//  1. các cách khai báo hàm
// truyền thống
function run(para1, paraN) {
    làm_gì_đó;
    return gì_đó;
}
run = function () {
    làm_gì_đó;
    return gì_đó;
};

// mặc định x,y là 1 và 1
var run = function (x = 1, y = 1) {
    return x + y;
};

// arrow function
var run = () => {
    làm_gì_đó;
    return_gì_đó;
};

// gọn hơn của arrow function
var run = (text) => console.log(text);

/*
2. truyền vào không đúng số lượng đối số không bị báo lỗi
    nhiều hơn thì hàm chỉ lấy đúng số lượng mà nó cần, còn lại sẽ bị thừa
    ít hơn thì các đối số còn lại sẽ là undefined

3. hàm có built-in object gọi là arguments object
    nó là một mảng chứa đối số đầu vào, cái này giống command line argument trong C
    dùng như một mảng bình thường

4. closorue function
    hàm trả về hàm và hàm, do js thì hàm cũng có thể coi là một biến
    có thể hàm trả về đó sẽ sử dụng biến mà chỉ nó mới sử dụng được
 */
// VD:
function add(num1) {
    return function (num2) {
        return num1 + num2;
    };
}
var add2 = add(2);
var add3 = add(3);
add2(1); // trả về 3
add3(1); // trả về 4

/* 
5. anoymus function
		hàm trả về hàm không tên (anonymus function)
		khi đó mình có thể gán biến thành function dựa vào kết quả trả về của hàm đó
		tự tạo hàm và chạy luôn nó
*/
// sau khi định nghĩa hàm thì nó tự chạy luôn, dấu "()" ở cuối nói điều đó
// VD:
(() => console.log("vo ly"))(); 

// 6. arrow function và hàm thường sẽ khác nhau khi sử dụng từ khóa this

