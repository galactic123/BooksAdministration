package com.book.control.JsonServlet;

import com.book.control.repository.StaticRespository;
import com.mysql.cj.xdevapi.JsonArray;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/usernum")
public class UsernumJsonExchange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        System.out.println(op);
        StaticRespository staticRespository = new StaticRespository();
        resp.setCharacterEncoding("UTF-8");
        if(op.equals("getall"))
        {
            System.out.println("asdasd");

            JSONArray jsonArray = JSONArray.fromObject(staticRespository.findall());
            System.out.println(jsonArray.toString());
            resp.getWriter().write(jsonArray.toString());

        }
    }

    public static void main(String[] args) {
        StaticRespository staticRespository = new StaticRespository();
        JSONArray jsonArray = JSONArray.fromObject(staticRespository.findall());
        System.out.println(jsonArray.toString());
    }
}
