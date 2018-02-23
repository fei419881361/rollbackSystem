<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/23
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="eazyui/jquery.min.js"></script>
    <script type="text/javascript" src="eazyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="eazyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="eazyui/themes/icon.css">
    <link id="linkstyle" rel="stylesheet" type="text/css" href="eazyui/themes/default/easyui.css">
    <title></title>
</head>
<body>
    <table id="list">

    </table>
<script type="text/javascript">
    $(function () {
        $('#list').datagrid({
            url:'/student/findAllBySplit?sclass=null&sgrade=null&currentPage=1&lineSize=10',
            columns:[[
                {field:"sid",title:"学号",width:50},
                {field:"sname",title:"姓名",width:150},
                {field:"sclass",title:"班级",width:50},
                {field:"sgrade",title:"年级",width:50}
            ]],
            pagination:true
        });
    })
</script>
</body>
</html>
