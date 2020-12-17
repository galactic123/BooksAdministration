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
    <title>图书管理系统 - 注册</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bookico.ico" type="image/x-ico" />

    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
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
    <div > <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

        <div class="layui-form-item" style="color: white">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="username" name="myname" required id="username" lay-verify="username" placeholder="请输入用户" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item" style="color: white">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="fipassword" required  placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item" style="color: white">
            <label class="layui-form-label">重复密码</label>
            <div class="layui-input-inline">
                <input type="password"  name="repassword" id="sepassword" required  placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="go"  >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //Demo
    layui.use(['form','laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','element'], function(){
        var form = layui.form;


        $('#go').click(function () {
            var pa1 = $('#fipassword').val();
            var pa2 = $('#sepassword').val();
            var us1 = $('#username').val();
            var res='';
            if(pa1 !== pa2){
                layer.msg('两次输入的密码不一致');
            }
            else {
                $.ajax({
                    url:'/users'
                    ,async:false
                    ,method:'post'
                    ,data:'op=findbyusername&username='+us1
                    ,dataType:'text'
                    ,success:function (callback){
                        res = callback;
                    }
                })
            }
            console.log(res)
            if(res === '1'){
                layer.msg('用户名已存在');
            }
            else{
                $.ajax({
                    url: '/users'
                    ,async: false
                    ,method: 'post'
                    ,data: 'op=addone&username='+us1+'&password='+pa1
                    ,success:function (){
                        alert('注册成功，请重新登录');
                        window.location.href='login.jsp'
                    }
                })
            }
        })


    });

</script>

</html>
