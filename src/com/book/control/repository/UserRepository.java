package com.book.control.repository;

import com.book.control.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    public List<User> findall(){
        List<User>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from table_name";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            User thisuser = null;
            while (resultSet.next())
            {
                String username = resultSet.getString(1);
                System.out.println(username);
                String userpassword = resultSet.getString(2);
                thisuser = new User(username,userpassword);
                to_return.add(thisuser);
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
    public void EditPasswordbyUsername(String username,String Editpassword){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "update table_name set password = ? where username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,Editpassword);
            preparedStatement.setString(2,username);
            preparedStatement.execute();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

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
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select table_name.password from table_name where table_name.username = ?";

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
    public boolean isExist(String username){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String getuser = null;
//        System.out.println("ok");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from table_name where table_name.username = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next())
            {
                getuser = resultSet.getString(1);
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

        if(getuser != null){
                return true;
        }else return false;
    }
    public void addone(String username,String addpassword){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "insert into table_name value (?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,addpassword);

            preparedStatement.execute();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }
    public static void main(String[] args) {
        UserRepository userRepository = new UserRepository();
//        userRepository.EditPasswordbyUsername("user","123456");
        System.out.println(userRepository.isExist("user"));
    }

}
