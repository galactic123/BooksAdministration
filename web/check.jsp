<%@ page import="com.book.control.repository.UserRepository" %>
<%@ page import="com.book.control.entity.Admin" %>
<%@ page import="com.book.control.repository.AdminRepository" %>
<%@ page import="com.book.control.Backup" %><%--
  Created by IntelliJ IDEA.
  User: 10279
  Date: 2020-11-27
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Backup.Backupall();

        UserRepository userRepository = new UserRepository();
        String nm = request.getParameter("myname");
        String pw = request.getParameter("password");
        String type = request.getParameter("character");
        AdminRepository adminRepository = new AdminRepository();
        System.out.println(type);
        if(type.equals("用户")){
            if(userRepository.isExist(nm,pw)==true)
            {

                session.setAttribute("nm",nm);
                session.setAttribute("pw",pw);
                session.setAttribute("type",type);
                response.sendRedirect("UserFirstPage.jsp");
            }
            else response.sendRedirect("LoginFail.html");
        }

        else if (type.equals("管理员"))
        {
            if(adminRepository.isExist(nm,pw)==true)
            {

                session.setAttribute("nm",nm);
                session.setAttribute("pw",pw);
                session.setAttribute("type",type);
                response.sendRedirect("AdminFirstPage.jsp");
            }
            else response.sendRedirect("LoginFail.html");
        }
    %>
</body>
</html>
