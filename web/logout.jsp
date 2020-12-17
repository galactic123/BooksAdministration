<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>退出登录</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <%
        session.setMaxInactiveInterval(0);
    %>
    <script>
        $(function (){
            alert('注销成功，请重新登录');
            window.location.href="login.jsp"
        })
    </script>
</head>

<body>

</body>
</html>