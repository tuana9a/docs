// MẸO

console.log("%c tuan", "color:red"); // log ra với một số thuộc tính được thêm màu mè css
console.table([obj1, obj2, obj3]); // cái này rất tiện nếu các obj kia có chung thuộc tính, nhìn rất đã mắt
console.time("looper"); // và console.timeEnd('looper')
// cái này để đo thời gian thực của mỗi hành động đặt ở đầu đoạn code và cuối đoạn code đó
console.trace("gì đó"); // được sử dụng trong hàm sẽ log ra vị trí dòng code của hàm này và dòng nó được gọi
const tuan = { name: "tuan", age: 19 };
const { name, age } = tuan;
// sau đó mình có thể dùng trực tiếp name và age của cái sau kiểu như ép kiểu vậy
// dấu "..." trước một đối tượng hoặc một array
// VD: let a = [1,2]; let b = [...a,3,4];let c = [3,...a,4]
// đấu 3 chấm có ý nghĩa khá hay như trên ý là truyền toàn bộ phần tử của object hoặc mảng đó

// COMMON CODE

// BIẾN

// 1. không khai báo biến bắt đầu bằng $ sẽ nhầm lẫn với thư viện javascript
// 2. không khai báo biến nguyên thủy dạng object vì thực thi chậm và một số kết quả không mong muốn
// 3. các cách khai báo

var s = "hello world";
var s = "hello world";
// có thể báo bằng 2 dòng như thế này
var s = "cm \
				dm";
// nếu xuống dòng ở giữa xâu thì cần phải có dấu gạch như thế kia
var a = 100;
var a = 1e-2; // 1 * 10 ^ -2 tức 0.01
var c = 10e2; // 1000
var c = 10 > 9; // true
var c = true > 2; // false vì true convert thành 1, false convert thành 0
var c = 10 > 9 > 8; // fasle vì 10>9 thành true, true>8 là false
const x = 10; // khai báo hằng số
var x = 0xff; // 255, hệ cơ số 16
var x = 07; // không nên viết số 0 vì có thể hiểu thành hệ cơ số 8
var x = "5" + 2 + 3; // x là "523"
var x = 2 + 3 + "5"; // x là "55"
var x = "100" / "10"; // số 10
var x = "5" * "4"; // số 20
var x = "3" - "1"; // số 2
var x = "3" + "1"; // xâu "31"

// KIỂU DỮ LIỆU
/*
	1. kiểu chứa dữ liệu
		string, number, boolean, object, aate, array, function
	2. kiểu không chứa dữ liệu	
		null
		undefined
	3. chuyển đổi giữa các kiểu dữ liệu xem thêm ở type conversion trên w3school
*/

// CHƯA PHÂN LOẠI + ÉO HIỂU

/*
arrow funtion và function chỉ khác nhau khi trong hàm có dùng this
	this của hàm arrow là đối tượng gọi nó
	this của hàm bình thường là đối tượng toàn cục chính là brower hoặc window hoặc undefined
	nguyên nhân này có thể do trình biên dịch
	nên tránh những tĩnh huống oái oăm
		
toán từ ? : bây giờ có thể coi như một if else
	VD: age > 18 ? console.log("18+") : console.log("under 18")	
*/

var array = Array.from(new Set(users));
//hoặc
var array = [...new Set(users)];
//2 cái khai báo trên tạo ra mảng không trùng nhau từ mảng ban đầu

// hàm eval() //cái này ảo vl từ biểu thức text nó sẽ biến được thành phép tính cho máy tính, thật là vi diệu
var r = eval("1+2*3/4");
console.log(r);

var startAt = performance.now();
//code gì đó ở đây
var endAt = performance.now();
//2 cái trên có thể đo thời gian thực hiện một chức năng trong js, lấy 2 cái trừ đi nhau

// OUTPUT

document.write(); //overwrite document nên dùng cẩn thận
window.alert(); //pop up cái thông báo ở đầu trang web
console.log(); //log ra ở console
