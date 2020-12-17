<%--
  Created by IntelliJ IDEA.
  User: 10279
  Date: 2020-11-10
  Time: 0:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统 - 登录</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bookico.ico" type="image/x-ico" />
    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
    <style>
        html,body{
            width:100%;
            height:100%
        }
        body{
            background: url('img/star.jpg') no-repeat ;
            background-origin: border-box;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>




<body   >
<div style="padding: 20px;margin-left: 38%;margin-top: 100px;">
    <h1>登录</h1>
    <form class="layui-form layui-form-pane" action="check.jsp"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="username" name="myname" required  lay-verify="username" placeholder="请输入用户" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item" style="color: white">
            <h4>你的身份————————————</h4>
            <div class="layui-input-block" style="color: white">

                <input type="radio" name="character" value="用户" title="用户">
                <input type="radio" name="character" value="管理员" title="管理员" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <div class="layui-form-item" style="color: white">
            <a href="register.jsp" style="color: white">没有账号？点此注册</a>

        </div>
    </form>


</div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;


    });
</script>

</html>
