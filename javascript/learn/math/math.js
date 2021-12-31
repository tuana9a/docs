// ĐỐI TƯỢNG MATH

//	đối tượng Math không có constructor và tất cả các biến hoặc phương thức đều là static vật nên khi dùng không cần phải new mới
Math.max.apply(null, tên_mảng); // sẽ tìm ra giá trị lớn nhất của mảng đó

Math.min.apply(null, tên_mảng); // sẽ tìm min

Math.E; // returns Euler's number
Math.PI; // returns PI
Math.SQRT2; // returns the square root of 2
Math.SQRT1_2; // returns the square root of 1/2
Math.LN2; // returns the natural logarithm of 2
Math.LN10; // returns the natural logarithm of 10
Math.LOG2E; // returns base 2 logarithm of E
Math.LOG10E; // returns base 10 logarithm of E

Math.round(biến_số); //làm tròn số tới số nguyên gần nhất
Math.ceil(biến_số); //làm tròn lên
Math.floor(biến_số); //làm tròn xuống

Math.pow(x, y); //là x mũ y, x y có thể là số thực
Math.sqrt(biến_số); //là căn và có thể là số thực
Math.abs(biến_số); //là lấy giá trị tuyệt đối

Math.sin(); //đơn vị radian nếu muốn dùng độ thì phải Math.sin(x*Math.PI/180)
Math.cos();
Math.tan();
Math.asin();
Math.acos();
Math.atan();
Math.exp(x); //trả về e mũ x
Math.log();

Math.max(giá_trị1, giá_trịn); //sẽ tìm max trong các số trong ngoặc
Math.min(các_giá_trị); //	tìm min của các giá trị trong ngoặc

Math.random(); //	random giá trị từ 0 đến 1, luôn bé hơn 1
// sử dụng với làm tròn floor ceil và round và nhân với 10 hoặc 100,1000,... để lấy random số tự nhiên
// VD:
function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}
