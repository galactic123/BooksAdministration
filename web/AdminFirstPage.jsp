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
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">图书管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this"><a href="">首页</a></li>
            <li class="layui-nav-item"><a href="/AdminPage/book/book_show.jsp">信息管理</a></li>
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
            <li class="layui-nav-item"><a href="logout.jsp">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">图书信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="AdminPage/book/book_show.jsp">图书展示</a></dd>
                        <dd><a href="/AdminPage/book/book_stastic.jsp">图书统计</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户信息</a>
                    <dl class="layui-nav-child">
                        <dd ><a href="AdminPage/user/user_show.jsp">所有用户</a></dd>
                        <dd><a href="/AdminPage/borrow/borrow_show.jsp">用户借阅</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">违约信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/AdminPage/default/default_show.jsp">所有违约</a></dd>
                        <dd><a href="/AdminPage/default/default_stastic.jsp">违约统计</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">座位信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">所有座位</a></dd>
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
        <div style="padding: 15px;">
            <h1>欢迎您，管理员<%=session.getAttribute("nm")%></h1>
        </div>
        <div style="margin-top: 100px;padding: 15px">
            <h1>最近一周访问量概览</h1>
            <div id="main" style="width: 600px;height:400px;"></div>
        </div>
        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var result = '';
            $.ajax({
                url:'/usernum',
                dataType:'json',
                data:'op=getall',
                method:'post',
                async:false,
                success:function (res){
                    result = res;
                    console.log(result);
                }
            })
            var myChart = echarts.init(document.getElementById('main'));
            console.log(result.length);
            var size = result.length-1;
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '最近一周访问量'
                },
                tooltip: {},
                legend: {
                    data:['访问量']
                },
                xAxis: {
                    data: [result[size-6].date,result[size-5].date,result[size-4].date,result[size-3].date,result[size-2].date,result[size-1].date,result[size].date]
                },
                yAxis: {},
                series: [{
                    name: '访问量',
                    type: 'bar',
                    data: [result[size-6].num,result[size-5].num,result[size-4].num,result[size-3].num,result[size-2].num,result[size-1].num,result[size].num],
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        </script>
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
</script>
</body>
</html>