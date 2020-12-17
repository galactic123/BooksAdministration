<%--
  Created by IntelliJ IDEA.
  User: 10279
  Date: 2020-11-26
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>$Title$</title>

  </head>
  <body>
    <%
      response.sendRedirect("login.jsp");
    %>
    <table>
      <tr>
        <th>用户名</th>
        <th>密码</th>
      </tr>
      <c:forEach items="${list}" var="user">
        <tr>
          <td>
            ${user.username}
          </td>
          <td>
            ${user.password}
          </td>
        </tr>
      </c:forEach>
    </table>
  </body>
</html>
