package com.book.control.repository;

import com.book.control.entity.Admin;
import com.book.control.entity.User_num;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StaticRespository {
    public List<User_num> findall(){
        List<User_num>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/user_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="ls15212567561";
            connection = DriverManager.getConnection(url,user,password);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String nowtime = simpleDateFormat.format(new Date()).toString();
            String sql = "select * from user_num where date <= ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,nowtime);
            resultSet = preparedStatement.executeQuery();
            User_num thisnum = null;
            while (resultSet.next())
            {
                String date = resultSet.getString(1);
  //              System.out.println(date);
                String num = resultSet.getString(2);
                thisnum = new User_num(date,num);
                to_return.add(thisnum);
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

    public static void main(String[] args) {
        StaticRespository staticRespository = new StaticRespository();
        System.out.println(staticRespository.findall().toString());
    }
}
