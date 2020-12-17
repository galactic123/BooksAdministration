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
    <title>图书管理系统 - 管理员端</title>

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
            <li class="layui-nav-item "><a href="">首页</a></li>
            <li class="layui-nav-item layui-this"><a href="/AdminPage/book/book_show.jsp">信息管理</a></li>
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
                    <img src="/img/1.jpg" class="layui-nav-img">
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
                        <dd><a href="/AdminPage/book/book_show.jsp">图书展示</a></dd>
                        <dd ><a href="/AdminPage/book/book_stastic.jsp">图书统计</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">用户信息</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="/AdminPage/user/user_show.jsp">所有用户</a></dd>
                        <dd><a href="/AdminPage/borrow/borrow_show.jsp">用户借阅</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">违约信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/AdminPage/default/default_show.jsp">所有违约</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">座位信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
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
        <div style="margin-right: 600px;padding: 15px">
            <table class="layui-hide" id="allusers" lay-filter="test"></table>
        </div>
    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © Copyright 2020-2020    &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">网站说明</a>    &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">友情链接</a>
    </div>
</div>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var table = layui.table;
        table.render({
            elem: '#allusers'
            ,height: 600
            ,id: 'user'
            ,url: '/users'
            ,method:'post'

    //        ,toolbar: 'default'
            ,totalRow: true //合计行
            ,page: true //分页
            ,limit:10
            ,limits: [3,5,10,20]
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'username', title: '用户名', width:240}
                ,{field: 'password', title: '用户密码',event:'set-password', style:'cursor: pointer;',width:240}


            ]]
            ,parseData: function(res) { //res 即为原始返回的数据
                console.log(res);
                var result;
                if (this.page.curr) {
                    result = res.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                } else {
                    result = res.slice(0, this.limit);
                    console.log([result]);
                }
                return {"code": 0, "msg": "", "count": 10000, "data": result};
            }

        });
        table.on('tool(test)', function(obj){
            var data = obj.data;
            switch (obj.event)
            {
                case "set-password":
                    layer.prompt({
                        formType: 2
                        , title: '修改 用户名 为 [' + data.username + '] 的密码'
                        , value: data.password
                    }, function (value, index) {
                        layer.close(index);

                        //这里一般是发送修改的Ajax请求
                        $.ajax({
                            url:'/users',
                            method: 'post',
                            data:'op=edit&username='+data.username+'&val='+value,
                            dataType: 'json'

                        })
                        //同步更新表格和缓存对应的值
                        obj.update({
                            password: value
                        });
                    });
                    break;
            }
        })
    })
</script>
</body>
</html>