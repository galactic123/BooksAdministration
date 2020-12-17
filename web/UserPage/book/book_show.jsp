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
    <link rel="icon" href="${pageContext.request.contextPath}/img/bookico.ico" sizes="144x144" type="images/x-ico" />
    <title>图书管理系统 - 用户端</title>

    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
</head>
<body class="layui-layout-body">
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="getbook">借阅</a>
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="lookbook">查看图书信息</a>
</script>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">图书管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/UserFirstPage.jsp">首页</a></li>
            <li class="layui-nav-item layui-this"><a href="">信息管理</a></li>
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
                <li class="layui-nav-item layui-nav-itemed">
                    <a  href="javascript:;">图书信息</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="book_show.jsp">图书展示</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">我的信息</a>
                    <dl class="layui-nav-child">
                        <dd ><a href="/UserPage/user/user_show.jsp">我的账号</a></dd>
                        <dd><a href="/UserPage/borrow/borrow_show.jsp">我的借阅</a></dd>
                        <dd><a href="">超链接</a></dd>
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
        <div style="padding: 15px;">
            <h2>图书概览</h2>
        </div>
        <div style="margin-top: 15px;padding-right: 430px;padding-left: 10px">
            <h2>所有图书</h2>
            <div class="demoTable">
                搜索图书：
                <div class="layui-inline">
                    <input class="layui-input" name="id" id="searchname" autocomplete="off">
                </div>
                <button class="layui-btn" data-type="reload" id="go">搜索</button>
            </div>
            <table class="layui-hide" id="allbooks" lay-filter="test"></table>

        </div>
    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © Copyright 2020-2020   &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">网站说明</a>    &nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color: #185582">友情链接</a>
    </div>
</div>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#allbooks'
            ,height: 600
            ,id: 'book'
            ,url: '/book'
            ,method:'post'

  //          ,toolbar: 'default'
            ,totalRow: true //合计行
            ,page: true //分页
            ,limit:10
            ,limits: [3,5,10,20]
            ,cols: [[ //表头
  //              {type: 'checkbox', fixed: 'left'}
                {field: 'id', title: '书本ID', width:80}
                ,{field: 'name', title: '书名',width:240}
                ,{field: 'statu',title: '当前状态',event: 'set-statu',width: 100}
                ,{field: 'writer',title: '作者',event:'set-writer',width: 80}
                ,{field: 'publisher',title: '出版社',event: 'set-publisher',width: 240}
                ,{field: 'price',title: '价格',width: 80}
                ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
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
        $('#go').on('click',function (){

            var serchit = $('#searchname').val();
            if(serchit !== '')
            {
                table.reload('book',{
                    method:'post',
                    where:{
                        name:serchit,
                    }
                    ,page: {
                        curr:1
                    }
                })
            }
            else {
                table.reload('book',{
                    method:'post',
                    where:{
                        name:'all'
                    }
                    ,page: {
                        curr:1
                    }
                })
            }
            console.log(serchit);

        });
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            console.log(obj.event)
            if(layEvent === 'getbook' && data.statu === '在馆'){
                layer.confirm('确定借阅此书？请在15天之内归还', function(index){
                    obj.update({
                        statu:'不在馆'
                    });
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '/book',
                        method: 'post',
                        data:'op=update&id='+data.id+'&username='+"<%=session.getAttribute("nm")%>",

                        dataType:'json',
                    })
                    console.log(data);
                });
            }else if (layEvent === 'lookbook'){
                layer.open({
                    type:0,
                    content:'<img src="/img/book'+data.id+'.jpg" width="120" height="80"><br><br>'+'书本ID：'+data.id+'<br><br>'+'书本名称：'+data.name+'<br><br>'+'书本状态：'+data.statu+'<br><br>'+'图书作者：'+data.writer+'<br><br>'+'图书出版社：'+data.publisher+'<br><br>'+'图书价格：'+data.price+'<br><br>'
                })

            }
            else {
                layer.msg('查无此书')
            }
        });



    });


    //监听行工具事件

</script>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>