// MẢNG  ARRAY

// Mảng cũng là đối tượng
//		VD:khai báo kiểu 1
var a = ["tuấn", "long", "quỳnh anh"];
var a = ["tuấn", 1, false, { name: "tuấn", age: 19 }];
//có thể thấy mảng trong js không cần phải là cùng một kiểu dữ liệu
//	VD:khai báo kiểu 2
var a = []; //khai báo rỗng trước
a[0] = "tuấn";
a[1] = "long";
//... bao nhiêu phần tử cũng được
//VD:khai báo kiểu 3
var a = new Array(7); //khai báo số phần tử mảng
var a = new Array("tuấn", "long", "quỳnh anh"); //kiểu này khó đọc nên dùng kiểu khác

//VD:khai báo kiểu 4
var a = Array(5).fill(""); // sẽ được một mảng gồm 5 phần tử string là xâu rỗng
var a = Array(5).fill(1); // sẽ được một mảng gồm 5 phần tử là 1

var myArray = [];

myArray.length; //	để trả về số phần tử trong mảng
myArray.indexOf(giá_trị_phần_tử);
//hoặc
myArray.indexOf(giá_trị, vị_trí_start); //	trả về vị_trí nếu tìm thấy và -1 nếu không tìm thấy
myArray.lastIndexOf(giá_trị_phần_tử);
//hoặc
myArray.lastIndexOf(giá_trị, vị_trí_start); //	trả về vị_trí cuối của phần tử đó và -1 nếu không tìm thấy
myArray.include(giáTrịTìmKiếm); //	trả về true nếu có, false nếu không
myArray.find(tên_hàm); // trả về phần tử đầu tiên thỏa mãn điều kiện hàm truyền vào

//VD:
var numbers = [4, 9, 16, 25, 29];
var first = numbers.find(myFunction);
function myFunction(value, index, array) {
    return value > 18;
}
myArray.findIndex(tên_hàm); //		giống như find nhưng trả về vị trí của phần tử chứ không trả về giá trị

//như một for each bình thường nhưng khác là thực hiện trong hàm
myArray.forEach(tên_hàm);
//	với mõi vòng lặp, gọi hàm tên_hàm và truyền các đối số lần lượt giá_trị,vị_trí,chính_mảng_đó
//	không trả về gì mà chỉ thực hiện cục bộ trong mảng đó thôi
//		VD:
var txt = "";
var numbers = [45, 4, 9, 16, 25];
numbers.forEach(myFunction);
function myFunction(value, index, array) {
    txt = txt + value + "<br>";
}

//trả về các phần tử tương ứng nhưng đã được biến đổi
myArray.map(tên_hàm);
//		trả về một mảng mới với giá trị tương ứng đã được chỉnh sửa qua return, mảng cũ được giữ nguyên
//			VD:
var numbers1 = [45, 4, 9, 16, 25];
var numbers2 = numbers1.map(myFunction);
function myFunction(value, index, array) {
    return value * 2;
}

//trả về true false của các phần tử tương ứng
myArray.filter(tên_hàm);
//		trả về mảng mới các phần tử thỏa mãn true, mảng cũ được giữ nguyên
VD: var numbers = [45, 4, 9, 16, 25];
var over18 = numbers.filter(myFunction);
function myFunction(value, index, array) {
    return value > 18;
}

myArray.reduce(tên_hàm);
// hoặc
myArray.reduceRight(tên_hàm);
// nhiều hơn một đối số ở đầu thứ tự từ trái sang phải còn reduceRight là từ phải sang trái
// trả về một giá trị chính là total hay đối số đầu tiên của cái hàm đó
// VD:
var numbers1 = [45, 4, 9, 16, 25];
var sum = numbers1.reduce(myFunction, initToal_nếuMuốn);
function myFunction(total, value, index, array) {
    return total + value;
}

myArray.every(tên_hàm);
//	trả về true nếu tất cả phần tử thỏa mãn điều kiện, ngược lại là false
//VD:
var numbers = [45, 4, 9, 16, 25];
var allOver18 = numbers.every(myFunction);
function myFunction(value, index, array) {
    return value > 18;
}

myArray.some(tên_hàm);
// trả về true nếu tồn tại phần tử thỏa mãn điều kiện, không có sẽ là false
// VD: giống như every ở trên

myArray.toString();
// hảm này trả về xâu là nối của các phần tử con trong mảng cách nhau bởi dấu phẩy
myArray.join(xâu_phân_cách);
// cũng là nối các phần tử nhưng mình có thể set up nối bằng phẩn tử gì

myArray.push(giá_trị_hoặc_biến);
// để thêm một phần tử vào cuối mảng
// hàm này trả về độ dài mới của mảng luôn
// hoặc mẹo myArray[myArray.length]=giá_trị_hoặc_biến

myArray.pop();
// để pop phần tử cuối mảng ra
// hàm này trả về luôn phần tử đó

myArray.shift();
// để pop phần tử đầu tiên của mảng và "shift" các phần tử sau về phía trước nice :)
// hàm này trả về phần tử đó luôn

myArray.unshift(phần_tử_mới);
// để thêm phần tử vào đầu mảng và shift các phần tử sau về sau nice :)
// trả về số phần tử thêm vào

// cái này dùng để thêm phần tử hoặc xóa phần tử của mảng
myArray.splice(vị_trí, vị_trí, râu_ria);
// vị_trí đầu tiên chính là vị trí bắt đầu thêm vào
// vị_trí thứ hai chính là số phần tử bị loại bỏ tính từ vị trí bắt đầu
// râu_ria ở đây chính là các phần tử thế chỗ cho các phẩn tử bị out
//      hoặc có thể bỏ trống tức là xóa phần tử giống như pop luôn
// hàm này trả về mảng các phần tử bị out ra
// VD:
myArray.splice(1, 2, "tuấn", "truong"); 
// sẽ xóa phần tử ở vị trí 1 tính từ đó là 2 phần tử và thêm vào đó 2 phần tử mới là "tuấn" và "truong"

myArray.concat(mảng_khác_hoặc_biến_mảng);
// sẽ nối mảng trong ngoặc vào cuối mảng cần nối vào

myArray.slice();
// có 2 dạng
myArray.slice(2); //sẽ lấy phần tử thứ 3 của mảng nhưng không thay đổi mảng
myArray.slice(1, 3); //sẽ lấy phần tử thứ 2,3 không lấy phần tử 4

myArray.sort();
//sẽ sắp xếp các phần tử mảng theo bảng chữ cái
//do sắp xếp theo bảng chữ cái bên khi sắp xếp theo mảng toàn số sẽ bị sai kết quả do vậy cần compare function
myArray.sort(function (a, b) {
    return a - b;
});
// hiểu là khi sắp xếp x thì khi so sánh 2 phần tử thì sort() sẽ gọi hàm của mình ra và truyền vào đó đúng 2 phần tử
// và trả về các giá trị âm dương hoặc 0 khi đó
// VD: dương thì a lên trước b, âm thì a sau b, 0 thì không thay đổi vị trí 2 thằng

// sẽ đảo ngược thứ tực phần tử mảng
myArray.reverse();

Math.max.apply(null, myArray); // sẽ tìm ra giá trị lớn nhất của mảng đó
Math.max(giá_trị1, giá_trịn); //sẽ tìm max trong các số trong ngoặc
Math.min.apply(null, myArray); //sẽ tìm min
Math.min(các_giá_trị); // tìm min

// [CHÚ Ý] mặc dù là object thật nhưng không được gán chỉ số là chữ như object thật nếu gán sẽ dẫn tới kết quả sai bét
var person = [];
person["firstName"] = "John";
person["lastName"] = "Doe";
person["age"] = 46;
var x = person.length; // person.length will return 0
var y = person[0]; // person[0] will return undefined
// do array được coi là object nên để phân biệt 2 thằng này mình sẽ
chưa_biết.isArray();
// trả về true nếu đúng false nếu ngược lại
// hoặc
function isArray(x) {
    return x.constructor.toString().indexOf("Array") > -1;
}
// cái hàm trên sẽ xem nguyên mẫu của x có từ khóa Array không :)
// hoặc
x instanceof Array;
// trả về true nếu được tạo bởi constructor của Array tức là mảng đó ba :)
