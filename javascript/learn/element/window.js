window.setTimeout(tên_hàm, thời_gian); //cái này sẽ thực hiện hàm trễ hơn thời_gian kể từ lúc load script
// hoặc
setTimeOut(tên_hàm, thời_gian);

window.setInterval(tên_hàm, thời_gian);
//hoặc
window.setInterval(tên_hàm, thời_gian); // cái này tương tự cái trên nhưng sẽ lặp lại trong khoảng thời_gian cố định (lần đầu cũng trễ như setTimeOut)
window.clearTimeout(tên_biến);
// hoặc
window.clearTimeout(tên_biến);

// tên_biến được trả về từ hàm set ở trên
// VD:
var clock = setTimeout(myTimer, 2000);
clearTimeout(clock); //nếu như này chì chưa kịp chạy đã bị clear rồi
window.clearInterval(tên_biến);
//hoặc
window.clearInterval(tên_biến); // tương tự như clearTimeout
