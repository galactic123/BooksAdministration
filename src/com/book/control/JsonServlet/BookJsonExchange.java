package com.book.control.JsonServlet;

import com.book.control.entity.Book;
import com.book.control.repository.BookRespository;
import com.book.control.repository.BorrowRespository;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/book")
public class BookJsonExchange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BookRespository bookRespository  = new BookRespository();
        String op = req.getParameter("op");
        System.out.println(op+"asd");
        if(op!=null)
        {
            if(op.equals("add"))bookRespository.addone();
            else if(op.equals("edit")){
                String set = req.getParameter("set");
                String id = req.getParameter("id");

                String val = req.getParameter("val");
                System.out.println(set+" "+id+" "+val);
                if(set != null && id !=null && val != null)
                {
                    bookRespository.EditbyString(set,val,id);
                }
            }else if(op.equals("delete")){
                String id = req.getParameter("id");
                System.out.println(id);
                bookRespository.delete(id);
            }
            else if(op.equals("update")){

                String username = req.getParameter("username");
                String id = req.getParameter("id");
                List<Book>list = bookRespository.findbyID(Integer.valueOf(id));
                bookRespository.EditbyString("statu","不在馆",id);
                Book book = list.get(0);
                BorrowRespository borrowRespository = new BorrowRespository();
                System.out.println(username);
                borrowRespository.addone(book,username);
                return;
            }
            else if(op.equals("fstatu"))
            {
                List<Book>list = bookRespository.findbyStatu("在馆");
                List<Book>list1 = bookRespository.findbyStatu("不在馆");
                Map<String,Object>mp = new HashMap<>();
                mp.put("yes",list.size());
                mp.put("no",list1.size());
                JSONArray jsonArray = JSONArray.fromObject(mp);
                resp.setCharacterEncoding("UTF-8");
                System.out.println(jsonArray.toString());
                resp.getWriter().write(jsonArray.toString());
                return;
            }
        }
        String name = req.getParameter("name");

        if(name!=null&& !name.equals("all"))
        {
            JSONArray jsonArray = JSONArray.fromObject(bookRespository.findbyName(name));
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonArray.toString());
        }
        else{
            JSONArray jsonArray = JSONArray.fromObject(bookRespository.findall());
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonArray.toString());
        }




    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookRespository bookRespository  = new BookRespository();

        JSONArray jsonArray = JSONArray.fromObject(bookRespository.findall());
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonArray.toString());

    }
}
