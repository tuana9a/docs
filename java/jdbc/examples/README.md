# Examples

```java
package com.tuana9a.learnjava.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/database-name";
        String user = "username";
        String password = "password";
        String query = "SELECT * FROM world.city";
        try {
            // Class.forName("com.mysql.cj.jdbc.Driver")
            // không cần phải gọi trước khi dùng nữa
            Connection connection = DriverManager.getConnection(url, user, password);// tạo connection
            Statement statement = connection.createStatement();// tạo statment
            ResultSet rs = statement.executeQuery(query);// thực hiện query

            while (rs.next()) {// thao tác trên kết quả trả về
                System.out.printf("%2d %4s\n", rs.getInt(1), rs.getString(2));
            }

            connection.close();// đóng connection
            System.out.println("Run perfect");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

# More

```java
package com.tuana9a.learnjava.jdbc;

import java.sql.*;

public class More {
    public static void main(String[] args) throws SQLException {
        /* DriverManager
           đây là một class để quản lý driver kết nối database
           tác dụng là kết nối tới database
           gọi .getConnection(...) trả về Connection */

        /* Connection
            là một class quản lý về kết nối
            lấy đươc bằng .getConnection() vủa DriverManager
            tác dụng là trao đổi thông tin trên Connection đó bằng cách tạo Statement */

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database-name");

        /* Statement
            là class để tạo các lệnh, quản lý thực thi chúng
            lấy được bằng .createStatement() của Connection
            tác dụng là thực thi các câu lệnh đó và có thể trả về int, boolean, ResultSet*/

        Statement statement = connection.createStatement();

        /* PreparedStatement
            cũng là class để tạo các lệnh, quản lý thực thi chúng
            điểm khác là do dược prepared, đã được complied, nên thực thi nhanh hơn
            lấy được bằng .prepareStatement() của Connection
            đặc trưng query string sẽ có ký tự '?' chính là tham số sẽ truyền vào sau này
                nhưng thường dấu hỏi sẽ được thay bởi tên cột chứ không tên bảng được
                index tính từ 1, NOT từ 0 */

        PreparedStatement preparedStatement = connection.prepareStatement("SOME SQL");

        /* ResultSet
            là một class xử lý và chứa kết quả trả về từ SELECT
            lấy được sau khi Statement(hoặc PrepareStatement) được execute
            tác dụng là đọc kết quả trả về (có một con trỏ trỏ tới row của bảng trả về)
            có phương thức get để lấy data tương ứng */

        ResultSet resultSet = null;
        resultSet = statement.executeQuery("SOME SQL");
        resultSet = preparedStatement.executeQuery();

        /* ResultSetMetaData
            là một class chứa thông tin của kết quả trả về
            lấy được bằng phương thức .getMetaData() của ResultSet */

        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();

        /* DatabaseMetaData
            là một class chứa thông tin của database
            lấy được bằng phương thức của .getMetaData() của Connection */

        DatabaseMetaData databaseMetaData = connection.getMetaData();

        /* Batch
            khi bạn muốn thực hiện nhiều câu lệnh một lúc
            thực hiện được bằng .addBath() của Statement hoặc
                PreparedStatement sau đó dùng .excuteBatch() để thực hiện */

        statement.addBatch("SOME SQL");
        statement.executeBatch();

        preparedStatement.addBatch("SOME SQL");
        preparedStatement.executeBatch();

        /*  Transaction Statement
            khi bạn muốn hủy giao kèo hoặc undo nhưng thứ đã làm
            .setAutoCommit(boolean b) của Connection mặc định là true nên mọi câu lệnh sẽ dược thực thi
            vậy nếu .setAutoCommit(false)
                thì có thể dùng phương thức là .commit() và .rollback()
                    .commit() sẽ thừa nhận là đã giao dịch và không hoàn trả
                    .rollback() sẽ hủy giao dịch và hoàn trả lại những gì đã làm
        *	trước khi commit mà có SQLException thì tất cả các câu lệnh trước nó đều sẽ bị hủy theo */

        connection.setAutoCommit(false);
        connection.commit();
        connection.rollback();

        /* CallableStatement
            dùng các procedure đã được lưu trong database
            lấy được bằng phương thức .prepareCall(String sql) của Connection, sau đó có thể set vị trí như prepareStatement
            thực thi bằng .executeQuery của chính nó
            trả về một bảng như select bình thường */

        CallableStatement callableStatement = connection.prepareCall("SOME PROCEDURE");
    }
}
```