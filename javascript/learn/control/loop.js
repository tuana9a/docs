// [MỚI] for of
// thường dùng cho các thành phần có tính chất lặp kiểu như mảng,String,Map,Nodelists,...
// VD:
var cars = ["BMW", "Volvo", "Mini"];
var x;

for (x of cars) {
    document.write(x + "<br>");
}
// nếu là String thì mỗi lần lặp sẽ là một ký tử của xâu đó

// [MỚI] for in
// dùng để duyệt mảng hoặc duyệt đối tượng
// VD:

var clocks = [];
var x;
for (x in clocks) {
    console.log(clocks[x]); // để in ra các phần tử trong đối tượng dongHo;
}

var arr = [];
for (x in arr) {
    console.log(arr[x]); // để in ra tất cả các phần tử trong mảng a
}

for (x in arr) {
    continue; // continue vòng lặp
}

for (x in arr) {
    break; // break vòng lặp
}

// label có thể dùng label để gộp một đống code vào trong {}
// và có thể dùng break trong label còn continue thì éo hiểu
// VD:

let text = "";
thisBlock: {
    text += cars[0] + "<br>";
    text += cars[1] + "<br>";
    if (text == "VinFast") {
        break thisBlock; // sẽ skip phần cuối nếu text là vinFast
    }
    text += cars[2] + "<br>";
    text += cars[3] + "<br>";
}
