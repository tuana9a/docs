import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

public class DataTypes {
    // Hằng số
    public static final int HANG_SO = 4; // hằng số ko thể thay đổi

    static class Human {

    }

    public static void main(String[] args) {
        // int
        int a = -1;
        System.out.println(a);
        // char
        char c = 100;
        System.out.println(c);
        // hoặc
        char c1 = 'd';
        System.out.println(c1);
        // long
        long b = 99999999999999L; // L hoặc l bé có thể bỏ
        System.out.println(b);
        long l = 1_234_567; // từ java 7 có thể phân tách số thành dễ đọc như này
        System.out.println(l);
        // float
        float f = 9.99F; // F hoặc f bé ở cuối giá trị kiểu float
        System.out.println(f);
        // double
        double d = 10D; // D hoặc d bé ở cuối có thể bỏ
        System.out.println(d);
        // boolean
        boolean bool = (a == b); // cái này trả về true nếu a=b nếu a!=b thì false
        System.out.println(bool);
        // array
        int[] arr = new int[10];
        System.out.println(arr);
        int[] arr1 = { 1, 2, 3, 4 };
        System.out.println(arr1);
        Human[] arr2 = new Human[10];
        System.out.println(arr2);
        int[][] arr3 = new int[12][12];
        System.out.println(arr3);
        // giá trị mặc định nếu không được khai báo là 0,
        // char là '\u0000',
        // boolean là flase
    }

    public void String() {
        // String: chuỗi
        /*
         * không thể trừ xâu (chuỗi) trong java
         * không thể so sánh xâu lớn hơn bế hơn trong java
         * VD: a>b;
         * có thể so sánh xâu bằng
         * VD: a==b; //trả về true hoặc false như bolean
         * chú ý khi mình khai báo String là đối tượng
         */
    }

    public void StringBuilder() {
        // StringBuilder
        /*
         * sẽ đỡ tốn bộ nhớ hơn so với String khi cộng String với nhau khi dùng append()
         * vì String bình thường khi cộng phải tạo biến tạm rồi mới cộng
         */
    }

    public void Array() {
        // Array (mảng)
        // khai báo mảng và khởi tạo giá trị
        // VD: khai báo mảng a toàn phần tử là số nguyên
        int[] array = { 1, 2, 3, 4 };
        System.out.print(array);
        // khai báo là mảng có 10 phần tử và các phần tử được gán bằng 0
        int[] intArray = new int[10];
        System.out.println(intArray);
        // <strong>String ko phải mảng của nhiều phần tử char và ngược lại mảng của char
        // ko phải</strong>
        String[] stringArray = { "Nguyễn Ming Tuấn", "Nguyễn Quỳnh Anh", "Dương Bảo Long" };
        System.out.println(stringArray);
    }

    public void Date() {
        // Kiểu dữ liệu ngày tháng hay dùng
        // Date (ngày tháng)
        // khai báo và khởi tạo giá trị
        Date date = new Date();// mặc định sẽ lấy thời gian là hiện tại
        System.out.println(date);

        // Calendar
        // khai báo và khởi tạo
        Calendar calendar = Calendar.getInstance();// cái này hơi khó hiểu
        System.out.println(calendar);
        calendar.add(Calendar.HOUR, 1); // thêm một giờ cho biến c
        System.out.println(calendar);
        calendar.add(Calendar.HOUR, -1); // bớt một giờ cho biến c
        System.out.println(calendar);

        // LocalDateTime
        // cái thư viện này rất hữu dụng trong việc gọi ngày tháng
        // các phương thức đi với nó(tự tìm hiểu)
        LocalDateTime localDateTime = LocalDateTime.now();
        System.out.println(localDateTime);
    }
}
