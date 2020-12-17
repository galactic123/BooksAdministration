package com.book.control.repository;

import com.book.control.entity.Book;
import com.book.control.entity.Borrow;
import org.w3c.dom.ls.LSInput;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BorrowRespository {
    public List<Borrow> findall(){
        List<Borrow>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from borrowinfo";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Borrow thisBorrow = null;
            while (resultSet.next())
            {
                String id = resultSet.getString(1);
                //               System.out.println(id);
                String username = resultSet.getString(2);
                String bookid = resultSet.getString(3);
                String bookname = resultSet.getString(4);
                String statu = resultSet.getString(5);
                String borrowtime = resultSet.getString(6);
                String returntime = resultSet.getString(7);
                thisBorrow = new Borrow(id,username,bookid,bookname,statu,borrowtime,returntime);
                to_return.add(thisBorrow);
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
    public List<Borrow> finddefault(){
        List<Borrow>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from borrowinfo where statu = '违约' or statu = '待处理'";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Borrow thisBorrow = null;
            while (resultSet.next())
            {
                String id = resultSet.getString(1);
                //               System.out.println(id);
                String username = resultSet.getString(2);
                String bookid = resultSet.getString(3);
                String bookname = resultSet.getString(4);
                String statu = resultSet.getString(5);
                String borrowtime = resultSet.getString(6);
                String returntime = resultSet.getString(7);
                thisBorrow = new Borrow(id,username,bookid,bookname,statu,borrowtime,returntime);
                to_return.add(thisBorrow);
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
    public void delete(String id,String bookid){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "delete from borrowinfo where id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
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
        BookRespository bookRespository = new BookRespository();
        bookRespository.EditbyString("statu","在馆",bookid);
    }
    public void reload(){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String nowtime = simpleDateFormat.format(new Date()).toString();
            System.out.println(nowtime);
            String sql = "update borrowinfo set statu = '违约' where returntime < ? and statu != '归还' and statu !='待处理'";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, nowtime);
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
    public List<Borrow> findbyusername(String name){
        List<Borrow>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from borrowinfo where username = ? and statu != '违约' and statu !='待处理'";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            resultSet = preparedStatement.executeQuery();
            Borrow thisBorrow = null;
            while (resultSet.next())
            {
                String id = resultSet.getString(1);
                //               System.out.println(id);
                String username = resultSet.getString(2);
                String bookid = resultSet.getString(3);
                String bookname = resultSet.getString(4);
                String statu = resultSet.getString(5);
                String borrowtime = resultSet.getString(6);
                String returntime = resultSet.getString(7);
                thisBorrow = new Borrow(id,username,bookid,bookname,statu,borrowtime,returntime);
                to_return.add(thisBorrow);
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
    public List<Borrow> findbydeusername(String name){
        List<Borrow>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from borrowinfo where username = ? and (statu = '违约' or statu = '待处理')";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            resultSet = preparedStatement.executeQuery();
            Borrow thisBorrow = null;
            while (resultSet.next())
            {
                String id = resultSet.getString(1);
                //               System.out.println(id);
                String username = resultSet.getString(2);
                String bookid = resultSet.getString(3);
                String bookname = resultSet.getString(4);
                String statu = resultSet.getString(5);
                String borrowtime = resultSet.getString(6);
                String returntime = resultSet.getString(7);
                thisBorrow = new Borrow(id,username,bookid,bookname,statu,borrowtime,returntime);
                to_return.add(thisBorrow);
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
    public void editbyID(String id,String setoption,String val){

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "update borrowinfo set "+ setoption +" = ? where id = ? ";
            preparedStatement = connection.prepareStatement(sql);
   //         preparedStatement.setString(1,setoption);
            preparedStatement.setString(1,val);
            preparedStatement.setString(2,id);
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
        return ;
    }
    public Integer getCountData(){
        Integer DataSize = 0;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from borrowinfo";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Borrow thisBorrow = null;
            while (resultSet.next())
            {
                String nowid = resultSet.getString(1);
                DataSize = Math.max(Integer.parseInt(nowid),DataSize);
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
        return DataSize+1;
    }
    public void addone(Book book,String username){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/borrow_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date today = new Date();
            String nowtime = simpleDateFormat.format(new Date()).toString();
            SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
            String returntime = simpleDateFormat1.format(new Date(today.getTime()+15 * 24 * 60 * 60 * 1000));
            String sql = "insert into borrowinfo value (?,?,?,?,?,?,?)";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, getCountData().toString());
            preparedStatement.setString(2,username);
            preparedStatement.setString(3, String.valueOf(book.id));
            preparedStatement.setString(4,book.name);
            preparedStatement.setString(5,"正常");
            preparedStatement.setString(6,nowtime);

            preparedStatement.setString(7,returntime);
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
        BorrowRespository borrowRespository = new BorrowRespository();
        borrowRespository.reload();
        System.out.println(borrowRespository.findbyusername("user").toString());
    }
}
