// DATE

/*
	khởi tạo dùng constructor cùng từ khóa new
	khởi tạo tháng sẽ từ số 0 đến số 11
	khi khởi tạo nên viết thêm số 0 ở đầu các số mà chỉ có một chữ số
	javascript lưu ngày tháng dưới dạng thời gian miliseconds tính từ ngày 1/1/1970	khi khởi tạo có thể có giá trị âm
	khi in ra mặc định đối tượng date sẽ được .toString()
	biến_date có thể so sánh với nhau
*/
// VD:
new Date(); //	cái này sẽ combo Thứ Tháng Ngày Năm Giờ Phút Giây Múi Giờ
new Date(year, month, day, hours, minutes, seconds, milliseconds_nếu_có);
//				cái này theo thứ tự khi khởi tạo sẽ set up đúng như trong ngoặc
//				cứ lần lượt bỏ đối số thì sẽ là thông số còn lại
//				nhưng tối thiểu là 2 số thì thứ tự đó còn đúng nếu còn 1 đối số thì lại là miliseconds ở dưới
new Date(milliseconds);
//				miliseconds tính từ mốc mùng 1 tháng 1 năm 1970 gì đó không biết là mốc gì :)
new Date(date_string);
//				cái này tính sau
//VD:
var d = new Date("October 13, 2014 11:13:00");
var d = new Date("2000-09-20");
var d = new Date("2000-09");
//			cứ thiếu thông số nào thì thông số đó sẽ là mặc định của máy tính
/*
các dạng string:
        ISO Date	"2015-03-25" (The International Standard)
            var d = new Date("2015-03-25T12:00:00Z");
            trong đó T là ngăn cách giữa ngày-tháng-năm và giờ-phút-giây Z là múi giờ mặc định UTC
        Short Date	"03/25/2015"
            "MM/DD/YYYY" hoặc "MM/DD/YY" khi đó 19XX
        Long Date	"Mar 25 2015" or "25 Mar 2015" or "March 25 2015" or "25, Mar, 2015"
            "MMM DD YYYY" hoặc "DD MMM YYYY"
        dạng ISO là chuẩn và các dạng khác có thể là tùy từng trình duyệt
        và khi out ngày tháng ra thì javascript mặc định sẽ output full string của cái date đó
*/

var myDate = new Date();

myDate.toString();
//	cái này là mặc định khi ngày tháng được in ra màn hình
myDate.toUTCString();
//	convert sang múi giờ chuẩn của thế giới
myDate.toDateString();
//	chỉ hiện ra thứ ngày tháng năm
Date.parse(myDate);
//	sẽ tính thời gian từ năm 1970 đến nay bằng miliseconds
Date(số_miliseconds);
//	sẽ convert ngược lại thời gian hiện tại bạn mong muốn

myDate.getFullYear(); // Get the year as a four digit number (yyyy)
myDate.getMonth(); //Get the month as a number (0-11)
myDate.getDate(); //Get the day as a number (1-31)
myDate.getHours(); //	Get the hour (0-23)
myDate.getMinutes(); //	Get the minute (0-59)
myDate.getSeconds(); //	Get the second (0-59)
myDate.getMilliseconds(); //Get the millisecond (0-999)
myDate.getTime(); //	Get the time (milliseconds since January 1, 1970)
//trả về thời gian ngày 1/1/1970
myDate.getDay(); //Get the weekday as a number (0-6)
//trả về ngày trong tuần
myDate.Date.now(); //	Get the time. ECMAScript 5.

myDate.getUTCDate(); //Same as getDate(), but returns the UTC date
myDate.getUTCDay(); //	Same as getDay(), but returns the UTC day
myDate.getUTCFullYear(); //Same as getFullYear(), but returns the UTC year
myDate.getUTCHours(); //Same as getHours(), but returns the UTC hour
myDate.getUTCMilliseconds(); //Same as getMilliseconds(), but returns the UTC milliseconds
myDate.getUTCMinutes(); //	Same as getMinutes(), but returns the UTC minutes
myDate.getUTCMonth(); //Same as getMonth(), but returns the UTC month
myDate.getUTCSeconds(); //	Same as getSeconds(), but returns the UTC seconds

//[CHÚ Ý]	các method dưới đây đều thực hiện được phép toán trong ngoặc
// và nếu cộng quá giới hạn thì máy sẽ tự tăng tháng hoặc năm hoặc đơn vị lớn hơn lên
myDate.setDate(); //Set the day as a number (1-31)
myDate.setFullYear(); //	Set the year (optionally month and day)
myDate.setHours(); //	Set the hour (0-23)
myDate.setMilliseconds(); //Set the milliseconds (0-999)
myDate.setMinutes(); //	Set the minutes (0-59)
myDate.setMonth(); //	Set the month (0-11)
myDate.setSeconds(); //Set the seconds (0-59)
myDate.setTime(); //Set the time (milliseconds since January 1, 1970)
