package com.book.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {


    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            Connection connection = DriverManager.getConnection(url,user,password);
            System.out.println(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
