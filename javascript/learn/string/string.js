// CHUỖI, XÂU, STRING

/*
[MỚI] chuỗi cũng là đối tượng
[MỚI] do chuỗi là đối tượng nên nó có những method dưới đây
    tên_chuỗi.length;
        trả về giá trị là độ dài của chuỗi này
*/
// Tìm kiếm

var myString = "some thign is nice";
var x = "";
myString.indexOf("từ_cần_tìm_trong_chuỗi");
//  trả về vị trí bắt đầu tìm thấy xâu đó bắt đầu từ số 0
myString.lastIndexOf("ký_tự_cuối");
//      trả về -1 nếu không tìm thấy
myString.search("từ_cần_tìm_trong_chuỗi");
//    giống như indexOf ở trên nhưng có một số trường hợp không tìm được
//  cũng trả về vị trí tìm thấy
//*			có thể dùng regular expression
//***		khác nhau giữa search và indexof
//      The search() method cannot take a second start position argument.
//    The indexOf() method cannot take powerful search values (regular expressions).
myString.charAt(vị_trí); // để xem chữ cái ở vị trí đó
//VD:
myString.charAt(0); //với x là "tuan" được "t"
myString.charCodeAt(vị_trí); // để xem mã Unicode của chữ cái đó ở vị trí đó
//như trên nhưng trả về mã unicode là trong khoảng từ 0 đến 2^16-1

// Chia nhỏ
myString.slice(vị_trí, vị_trí);
//     vị trí ở đây là theo mảng tức bắt đầu từ 0
//  VD:
slice(0, 2); // cho xâu "tuan" thì được "tu" tức 0 là vị trí bắt đầu và 2-1=1 là vị trí kết thúc
//*			nếu vị trí âm thì tính từ cuối xâu lên âm là từ (-1,-2,...)
//*			VD:
slice(-1, -2); //cho xâu "tuan" thì được "a" tức ngược theo đúng nghĩa đen
//*			nếu bỏ đối số thứ 2 thì sẽ cắt tới cuối xâu luôn
myString.substring(vị_trí, vị_trí);
//giống như slice khác mỗi là không nhận giá trị âm
myString.substr(vị_trí, số_lượng);
//lấy từ vị_trí với số_lượng
//VD:
substr(1, 1); //cho xâu "tuan" được "u"
//vị_trí có thể âm
myString.split("ký_tự_tách_hoặc_xâu");
//cái này sẽ tách xâu lớn thành mảng (1 mảng) dựa vào ký tự tách
//VD:
a = "tuan,long,nhatanh";
// thì
array = a.split(","); //sẽ thu được mảng gồm "tuan","long","nhatanh"
// nếu ký_tự_tách trống hoặc là xâu rỗng thì mảng sẽ gồm các chữ cái của mảng x

// Biến đổi
myString.toUpperCase();
//     biến tất cả chuỗi thành viết hoa
myString.toLowerCase();
//   biến tất cả thành viết thường
myString.concat(chuỗi_hoặc_biến_cách_nhau_bởi_dấu_phẩy_số_lượng_tùy_ý);
//VD:
myString.concat(x, y, z, "tuan", "long");
//  sẽ nối xâu x với xâu x,y,z,"tuan","long"
myString.trim(); //để xóa khoảng trắng ở 2 bên của xâu cái này giống trong java
//VD: "   tuấn x long   "  sẽ thành "tuấn x long"
// nếu trim không hỗ trợ thì dùng replace
replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, "");
myString.replace("xâu_muốn_thay", "tên_mới");
//     cái này giống kiểu find and replace và chỉ thay thể chuỗi nó tìm thấy đầu tiên
//   không thay đổi xâu gốc, cần gán cho cả cục ví dụ đó là một biến mới
// regular expression nôm na là các thuộc tính đi kèm
//   VD:
myString.replace(/Tuan/i, "Long"); // regex không phân biệt hoa thường
myString.replace(/tuan/g, "Long"); // regex thay tất cả, không phải một cái

myString[vị_trí]; // để đọc ký tự tại vị trí này
//	cái này chỉ dùng để đọc thôi chứ không dùng để gán
//				VD:
a = "tuan";
a[0] = "c"; //là đéo được mặc dù không báo lỗi
//không nên dùng kiểu này vì dễ hiểu nhầm thành mảng nhưng thực chất đây không phải mảng
