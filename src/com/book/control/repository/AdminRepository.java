package com.book.control.repository;

import com.book.control.entity.Admin;
import com.book.control.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminRepository {
    public List<Admin> findall(){
        List<Admin>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from admin_list";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Admin thisAdmin = null;
            while (resultSet.next())
            {
                String username = resultSet.getString(1);
                System.out.println(username);
                String userpassword = resultSet.getString(2);
                thisAdmin = new Admin(username,userpassword);
                to_return.add(thisAdmin);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return to_return;
    }
    public boolean isExist(String username,String passw){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String pword = null;
//        System.out.println("ok");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select admin_list.password from admin_list where admin_list.username = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next())
            {
                pword = resultSet.getString(1);
//                System.out.println(pword);

            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if(pword != null){
            if(pword.equals(passw))
                return true;
            else return false;
        }else return false;
    }

    public static void main(String[] args) {
        UserRepository userRepository = new UserRepository();
        System.out.println(userRepository.isExist("admin","123"));
    }

}
