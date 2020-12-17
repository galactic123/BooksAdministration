package com.book.control.repository;

import com.book.control.entity.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRespository {
    public List<Book> findall(){
        List<Book>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from booksinfo";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Book thisBook = null;
            while (resultSet.next())
            {
                int id = resultSet.getInt(1);
 //               System.out.println(id);
                String name = resultSet.getString(2);
                String statu = resultSet.getString(3);
                String wt = resultSet.getString(4);
                String pb = resultSet.getString(5);
                int pr = resultSet.getInt(6);
                thisBook = new Book(id,name,statu,wt,pb,pr);
                to_return.add(thisBook);
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
    public List<Book> findbyID(int findid){
        List<Book>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from booksinfo where booksinfo.id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,findid);
            resultSet = preparedStatement.executeQuery();
            Book thisBook = null;
            while (resultSet.next())
            {
                int id = resultSet.getInt(1);
 //               System.out.println(id);
                String name = resultSet.getString(2);
                String statu = resultSet.getString(3);
                String wt = resultSet.getString(4);
                String pb = resultSet.getString(5);
                int pr = resultSet.getInt(6);
                thisBook = new Book(id,name,statu,wt,pb,pr);
                to_return.add(thisBook);
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

    public List<Book> findbyName(String findname){
        List<Book>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from booksinfo where booksinfo.name = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, findname);
            resultSet = preparedStatement.executeQuery();
            Book thisBook = null;
            while (resultSet.next())
            {
                int id = resultSet.getInt(1);
//                System.out.println(id);
                String name = resultSet.getString(2);
                String statu = resultSet.getString(3);
                String wt = resultSet.getString(4);
                String pb = resultSet.getString(5);
                int pr = resultSet.getInt(6);
                thisBook = new Book(id,name,statu,wt,pb,pr);
                to_return.add(thisBook);
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
    public List<Book> findbyStatu(String findstatu){
        List<Book>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from booksinfo where booksinfo.statu = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,findstatu);
            resultSet = preparedStatement.executeQuery();
            Book thisBook = null;
            while (resultSet.next())
            {
                int id = resultSet.getInt(1);
//                System.out.println(id);
                String name = resultSet.getString(2);
                String statu = resultSet.getString(3);
                String wt = resultSet.getString(4);
                String pb = resultSet.getString(5);
                int pr = resultSet.getInt(6);
                thisBook = new Book(id,name,statu,wt,pb,pr);
                to_return.add(thisBook);
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
    public Integer getCountData(){
        Integer DataSize = 0;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "select * from booksinfo";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            Book thisBook = null;
            while (resultSet.next())
            {
                Integer nowid = resultSet.getInt(1);
                DataSize = Math.max(nowid,DataSize);
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
    public void addone(){
        List<Book>to_return = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String op = getCountData().toString();
            System.out.println(op);
            String sql = "insert into booksinfo values("+op+",'默认1','','','',0)";
            preparedStatement = connection.prepareStatement(sql);
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
    public void EditbyString(String setoption,String val,String id){

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "update booksinfo set "+setoption+" = ? where id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, val);
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

    }
    public void delete(String id){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/book_list?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user="root";
            String password="***";
            connection = DriverManager.getConnection(url,user,password);
            String sql = "delete from booksinfo where id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.valueOf(id));
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
        BookRespository bookRespository = new BookRespository();

//        System.out.println(bookRespository.findbyStatu("在馆").toString());
    }
}
