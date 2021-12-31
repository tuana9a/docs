// switch
/*
trong switch thì default không cần thiết phải đứng cuối và nếu không đứng cuối thì nó cần phải có break
nếu như có nhiều case thỏa mãn thì máy sẽ chọn case đầu tiên mà nó gặp
*/

// so sánh trong switch case là === tức so sánh nghiêm túc và cùng địa chỉ

let x = 5;
switch (x) {
    case "5":
        console.log("equals 5 string");
        break;
    case new Number(5):
        console.log("equals 5 object");
        break;
    case 5:
        console.log("equals 5 number (primitive)");
        break;
    default:
        console.log("the hell");
        break;
}

x = "tuan";
switch (x) {
    case new String("tuan"):
        console.log("equals x string object");
        break;
    case "tuan":
        console.log("equals x string primitive ?");
        break;
    default:
        console.log("the hell");
        break;
}
