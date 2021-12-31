// ĐỐI TƯỢNG SỐ

// số trong javascript mặc định là 64bit phần nguyên độ chính xác đến 15 chữ số còn phần phân (phần sau dấu phẩy) chính xác đến 17 con số nhưng cũng không chính xác hoàn toàn
//VD:
var x = 0.2 + 0.1; // x will be 0.30000000000000004
//đây là cách để fix lỗi này
var x = (0.2 * 10 + 0.1 * 10) / 10; // x will be 0.3

// [MỚI] chuyển đổi từ hệ cơ số 10 chú là chỉ từ hệ cơ số 10 thôi sang các hệ cơ số khác
biến_số.toString(giá_trị_hệ_cơ_số);
//		trong ngoặc sẽ là 2,8,10,32 hoặc bất kỳ số nào trong khoảng từ 2 đến 32 nếu bạn thích
biến.toExponential;
var x = 9.656;
x.toExponential(2); // returns 9.66e+0
x.toExponential(4); // returns 9.6560e+0
biến.toFixed; // làm tròn với số lượng phần phân trong ngoặc là cố định
var x = 9.656;
x.toFixed(0); // returns 10
x.toFixed(2); // returns 9.66
x.toFixed(4); // returns 9.6560
biến.toPrecision(); // viết số dưới độ dài cố định có tính cả phần phân ko tính dấu phẩy có làm tròn
var x = 9.656;
x.toPrecision(); // returns 9.656
x.toPrecision(2); // returns 9.7
x.toPrecision(4); // returns 9.656
biến.valueOf(); //cái này dùng khi biến số là object thì hàm sẽ trả về giá trị nguyên thủy của objec số này

//[MỚI] chuyển xâu thành số
Number();
Number(true); // returns 1
Number(false); // returns 0
Number("10"); // returns 10
Number("  10"); // returns 10
Number("10  "); // returns 10
Number(" 10  "); // returns 10
Number("10.33"); // returns 10.33
Number("10,33"); // returns NaN
Number("10 33"); // returns NaN
Number("John"); // returns NaN
Number("");
Number(" "); // both return 0
Number(true); // return 1, false return 0
Number(new Date("2017-09-30")); // returns 1506729600000, đây là số milisecon từ ngày 1.1.1970
parseInt(); //hơn Number() ở cái đọc được xâu có nhiều hơn 1 số hoặc có cả chữ
parseInt("10"); // returns 10
parseInt("10.33"); // returns 10
parseInt("10 20 30"); // returns 10
parseInt("10 years"); // returns 10
parseInt("years 10"); // returns NaN

// để chuyển đổi từ hệ cơ số bất kỳ thành hệ cơ số 10
// VD: parseInt("70",8); được 56 trong hệ cơ số 10
parseInt("hệ_cơ_số_bất_kỳ", hệ_cơ_số_đó);

parseFloat();
parseFloat("10"); // returns 10
parseFloat("10.33"); // returns 10.33
parseFloat("10 20 30"); // returns 10
parseFloat("10 years"); // returns 10
parseFloat("years 10"); // returns NaN

// [MỚI] chuyển từ số thành xâu
String(biến);
// hoặc
biến.toString(); //giống nhau
//để chuyển số thành xâu hoặc các phép toán sẽ thực hiện rồi chuyển thành xâu
//	VD:
String(x); // returns a string from a number variable x
String(123); // returns a string from a number literal 123
String(100 + 23)(
    /*returns a string from a number from an expression*/
    13
).toString(); // sẽ trả về "13" hoặc (12+13).toString(); sẽ trả về "25"

Number.MAX_VALUE; // giá trị lớn nhất javascript
Number.MIN_VALUE; // giá trị nhở nhất javascript
Number.POSITIVE_INFINITY; // chính là Infinity ở trên
Number.NEGATIVE_INFINITY; // chính là -Infinity ở trên
Number.EPSILON; //là hẳng số epsilon ở đâu không biết
Number.MIN_SAFE_INTERGER; // là số nguyên nhỏ nhất an toàn
Number.MAX_SAFE_INTERGER; //là số nguyên lớn nhất an toàn
// và các cái trên không dùng được cho biến thường mà dính chặt cùng Number luôn
NaN; //not a number tức không phải số
//	VD:
var x = 100 / "apple"; // thì x là NaN
var x = NaN,
    y = 1;
var z = x + y; //thì z sẽ là NaN
isNaN(x); //là hảm trả về true nếu x là NaN false nếu x không phải
typeof NaN; // sẽ trả về là number :)
Infinity;
/*hoặc*/ -Infinity;
//	tên riêng (keyword) Infinity và -Infinity đây là 2 biến ?? ( giá trị ??) nếu số bạn tính toán được nằm ngoài tầm với của máy tính
//	có thế sử dụng như sau
//		VD:
while (x != Infinity) {
    x *= x;
}
typeof Infinity; //sẽ trả về number

Number.isInterger(biến); //		trả về true nếu là số nguyên bất kỳ thức khác sẽ trả về false kể cả số thực
Number.inSafeInterger(biến); //	trả về true nếu là số thực an toàn nằm trong khoảng -(2^53-1) đến 2^53-1

//		VD: var x= inFinite(10/0); //flase
isFinite(1); //		trả về true nếu hữu hạn false nếu vô hạn hoặc NaN

//		trả về true nếu đúng là NaN và tất cả các trường hợpc còn lại là false
//		VD: isNaN("Hello");       // returns true
isNaN(NaN);
