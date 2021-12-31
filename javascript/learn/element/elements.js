// DOM

// constructor
var newElement = document.createElement("tên_thẻ_muốn_tạo");
var bigElement = document.getElementById("tên_id_của_thẻ");
var bigElement = document.getElementsByTagName("tên_thẻ");
var bigElement = document.getElementsByClassName("tên_class");

// selector
newElement.parentElement; // trả về phần tử là bố của phần tử hiện tại
newElement.querySelector("giống_selector_của_CSS"); //select phần tử đầu tiên trùng với cách tìm kiếm truy xuất cả đời cháu,chắt,chút,...
newElement.querySelectorAll("giống_selector_của_CSS"); //	trả về mảng các phần tử thoả mãn điều kiện

// method
bigElement.appendChild(newElement); //	gắn phantu vào khoito tức gắn thẻ nào đó với đại diện là phantu vào thẻ nào đó với đại diện là khoito
bigElement.insertBefore();
bigElement.inserAfter();

// property
newElement.innerText; // CHÚ Ý: innerText không thể trả về nội dung trong một thẻ nếu thẻ đó bị ẩn hoặc không nhìn thấy
newElement.textContent; // CHÚ Ý: cái này thì có thể trả về nội dung của thẻ mặc dù nó đã bị ẩn
newElement.innerContent = "nội dung thẻ này "; //	thay đổi nội dung trong thẻ

newElement.src = "new_source"; // có thể dùng cho thể img để thay đổi src của nó chẳng hạn
newElement.style.fontSize = "35px"; //	có thể dùng cho thể p,b,span chẳng hạn
newElement.style.display = "none"; //có thể dùng cho thẻ div hoặc các thẻ block hoặc nhiều thứ đi kèm
newElement.value = "tuấn"; //có thể dùng cho thẻ input để cho nó có chữ ở trong cái ô input chẳng hạn
newElement.placeholder = "do something"; //dùng cho thẻ input để nó có placeholder

newElement.checked; //dùng cho input[type="checkbox"] để check sự kiện được check hay không
//VD: if(checkBox.checked == true){làm_gì_đó} else {làm gì đó};
newElement.id; //để lấy id của thẻ
newElement.className; //cái này trả về class dang xâu
newElement.setAttribute("key", "value"); //VD: .setAttribute("class","centerVerHor"), để set thuộc tính cho một thẻ nào đó
newElement.getAttribute("key"); //ngược lại trên, để lấy một thuộc tính của một thẻ

// SCROLL
newElement.scrollBy(x, y); //scroll x pixcel theo chiều ngang, y pixcel chiều dọc
newElement.scrollTo(x, y); //scroll tới tọa độ x,y
newElement.scrollIntoView(); //có thể truyền vào tham số true false tùy ý

// VIDEO
var videoElement = document.createElement("video");
videoElement.paused; //trả về boolean xem video đã chạy hoặc dừng
videoElement.play(); //cho video hoặc âm thanh chạy
videoElement.pause(); // cho video hoặc âm thanh dừng
videoElement.width; //chỉnh độ to của video

// VD: chain ...
document.getElementsByClassName("dad")[0].querySelector(".son").style = "width:100%;";
//sẽ select phần tử đầu tiên có class là 'dad' rồi lại select tiếp phần tử đầu tiên có class là 'son' và set thuộc tính cho nó
//có thể thấy querySelector rất hữu dụng cho việc select phần tử con của các thằng này
//hơn thế querySelectAll() để select tất cả các phần tử và trả về một mảng như bình thường

document.body.scrollTop > 50; //body dài hơn doc, body overflow nên srcoll là scroll doc
document.documentElement.scrollTop > 50; //cái này chưa hiểu lắm
