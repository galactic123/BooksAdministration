<%--
  Created by IntelliJ IDEA.
  User: 10279
  Date: 2020-11-27
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>table模块快速使用</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.4/css/layui.css" media="all">
    <script src="https://www.layuicdn.com/layui-v2.5.4/layui.js"></script>
</head>
<body>

<table id="demo" lay-filter="test"></table>


<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url: '/t' //数据接口

            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'password', title: '用户名', width:80}
                ,{field: 'username', title: '密码', width:80}

            ]]
            ,parseData: function(res) { //res 即为原始返回的数据
                console.log(res);
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": 10000, //解析数据长度
                    "data": [res]//解析数据列表
                };
            }
        });

    });
</script>
</body>
</html>
