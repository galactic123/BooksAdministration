<%--
  Created by IntelliJ IDEA.
  User: 10279
  Date: 2020-11-18
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bookico.ico" type="image/x-ico" />
    <title>图书管理系统 - 用户端</title>

    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">图书管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item  "><a href="">首页</a></li>
            <li class="layui-nav-item layui-this"><a href="/UserPage/book/book_show.jsp">信息检索</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/img/user<%=session.getAttribute("nm")%>.jpg" class="layui-nav-img">
                    <%=session.getAttribute("nm")%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout.jsp">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">图书信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/UserPage/book/book_show.jsp">图书展示</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">我的信息</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this" ><a href="/UserPage/user/user_show.jsp">我的账号</a></dd>
                        <dd ><a href="/UserPage/borrow/borrow_show.jsp">我的借阅</a></dd>
                        <dd ><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">违约信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/UserPage/default/default_show.jsp">我的违约</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">座位信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">我的座位</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">待开发</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style=" padding: 15px">
            <h3><em>我的头像</em></h3><br>
            <img src="/img/user<%=session.getAttribute("nm")%>.jpg" width="120" height="80"><br>
            <div class="layui-upload" style="padding: 15px" id="goimg">
                <button type="button" class="layui-btn" id="uimg">更改头像</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1">
                    <p id="demoText"></p>
                </div>
            </div>
            <em>我的用户名： &nbsp;&nbsp;&nbsp;&nbsp;<h3><%=session.getAttribute("nm")%></h3></em><br>

        </div>
        <div style="padding: 15px">
            <button class="layui-btn" data-type="editpassword" id="go">修改密码</button>

        </div>
    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © Copyright 2020-2020    &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">网站说明</a>    &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">友情链接</a>
    </div>
</div>
<div style="padding: 15px;;display: none" id="edit" >
    <h1>修改密码</h1>
    <div class="layui-form layui-form-pane" > <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-inline">
                <input type="password" name="oldpassword" id="olp"required   placeholder="请输入当前密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newpassword" id="nep" required  placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重复密码</label>
            <div class="layui-input-inline">
                <input type="password" name="sepassword" id="sep"required  placeholder="请重复新密码" autocomplete="off" class="layui-input">
            </div>
            <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  id="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        $("#go").click(function (){
            layer.open({
                type:1,
                title:'修改密码',
                area:['26%','43%'],
                offset: 'auto',
                content:$('#edit'),
            })
        })
        var upload = layui.upload;
        upload.render({
            elem: '#uimg'
            ,url:'/upload?name=user'+'<%=session.getAttribute("nm")%>'


            ,done: function(res){
                layer.msg('上传成功');
                window.location.reload();
            }

        })

        $("#submit").click(function (){
            var oldpassword = $('#olp').val();
            var newpassword = $('#nep').val();
            var sepassword = $('#sep').val();
            var result = '';
            if(newpassword !== sepassword)
            {
                layer.msg('两次输入的密码不一致');
            }
            else {
                $.ajax({
                    async:false,
                    url:'/users',
                    dataType:'text',
                    method:'post',
                    data:'op=find&username='+'<%=session.getAttribute("nm")%>'+'&password='+oldpassword,
                    success:function (callback) {
                        result = callback;

                    }
                })
            }
            if(result === '1')
            {
                $.ajax({
                    async: false,
                    url: '/users',
                    method: 'post',
                    data: 'op=edit&username=' + '<%=session.getAttribute("nm")%>'+'&val='+newpassword,
                    success:function (){
                        alert("修改成功，请重新登录");
                        window.location.href="/login.jsp"
                    }
                })
            }else if(result === '0'){
                layer.msg('密码错误');
            }
        })
    })
</script>
</body>
</html>