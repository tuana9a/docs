package com.tuana9a;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Example {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/database-name";
        String user = "username";
        String password = "password";
        String query = "SELECT * FROM world.city";
        try {
            // Class.forName("com.mysql.cj.jdbc.Driver") // không cần phải gọi trước khi dùng nữa
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
