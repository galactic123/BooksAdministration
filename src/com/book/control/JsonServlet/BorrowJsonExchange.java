package com.book.control.JsonServlet;

import com.book.control.entity.Borrow;
import com.book.control.repository.BookRespository;
import com.book.control.repository.BorrowRespository;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/borrow")
public class BorrowJsonExchange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        BorrowRespository borrowRespository = new BorrowRespository();
        borrowRespository.reload();
        resp.setCharacterEncoding("UTF-8");
        System.out.println("op = "+op);
        if(op!=null)
        {

            switch (op)
            {
                case "del":
                    String id = req.getParameter("id");
                    String bookid = req.getParameter("bookid");
                    borrowRespository.delete(id,bookid);
                    JSONArray jsonArray = JSONArray.fromObject(borrowRespository.findall());
                    resp.getWriter().write(jsonArray.toString());
                    break;
                case "de":
                    System.out.println("get default");
                    jsonArray = JSONArray.fromObject(borrowRespository.finddefault());
                    resp.getWriter().write(jsonArray.toString());
                    break;
                case "findname":
                    String name = req.getParameter("name");
                    jsonArray = JSONArray.fromObject(borrowRespository.findbyusername(name));
                    resp.getWriter().write(jsonArray.toString());
                    break;
                case "update":
//                    System.out.println("okasdnasn");
                    id = req.getParameter("id");
                    String action = req.getParameter("action");
                    if(action.equals("back")){
                        borrowRespository.editbyID(id,"statu","待处理");
                        BookRespository bookRespository = new BookRespository();
                        bookid = req.getParameter("bookid");
                        bookRespository.EditbyString("statu","在馆",bookid);
                    }
                    break;
                case "finddename":
                    System.out.println("asdasdqwwqw");
                    String dename = req.getParameter("name");
                    jsonArray = JSONArray.fromObject(borrowRespository.findbydeusername(dename));
                    resp.getWriter().write(jsonArray.toString());
                    break;
                case "deper":
                    System.out.println("deper");
                    List<Borrow>list = borrowRespository.findall();
                    List<Borrow>list1 = borrowRespository.finddefault();
                    double p = list1.size()*1.0/list.size()*1.0*100;
                    resp.getWriter().write(String.valueOf((int)p));
                    break;
            }
        }
        else{
            JSONArray jsonArray = JSONArray.fromObject(borrowRespository.findall());
            resp.getWriter().write(jsonArray.toString());
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public static void main(String[] args) {

        BorrowRespository borrowRespository = new BorrowRespository();
        List<Borrow>list = borrowRespository.findall();
        List<Borrow>list1 = borrowRespository.finddefault();
        double p = list.size()*1.0/list1.size()*1.0;
        System.out.println(String.valueOf(p));
    }
}
