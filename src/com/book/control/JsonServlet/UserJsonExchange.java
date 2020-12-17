package com.book.control.JsonServlet;

import com.book.control.entity.User;
import com.book.control.repository.UserRepository;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/users")
public class UserJsonExchange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserRepository userRepository = new UserRepository();
        String op = req.getParameter("op");
        if(op != null)
        {
            switch (op)
            {
                case "edit":
                    String username = req.getParameter("username");
                    String val  = req.getParameter("val");
                    userRepository.EditPasswordbyUsername(username,val);
                    break;
                case "delete":

                    break;
                case "find":

                    username = req.getParameter("username");
                    String password = req.getParameter("password");
                    if(userRepository.isExist(username,password)==true)
                    {
                        resp.getWriter().write("1");
                    }else
                    {
                        resp.getWriter().write("0");
                    }
                    break;
                case "findbyusername":
                    username = req.getParameter("username");
                    if(userRepository.isExist(username)==true)
                    {

                        resp.getWriter().write("1");
                    }else
                    {
                        resp.getWriter().write("0");
                    }
                    break;
                case "addone":
                    username = req.getParameter("username");
                    password = req.getParameter("password");
                    userRepository.addone(username,password);
                    break;
            }
        }
        else{
            JSONArray jsonArray = JSONArray.fromObject(userRepository.findall());
            resp.getWriter().write(jsonArray.toString());
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserRepository userRepository = new UserRepository();
        User user = new User("123","123");
        JSONObject jsonObject = JSONObject.fromObject(user);
        resp.getWriter().write(jsonObject.toString());
    }

    public static void main(String[] args) {
        UserRepository userRepository = new UserRepository();
        System.out.println(userRepository.findall().toString());
    }
}
