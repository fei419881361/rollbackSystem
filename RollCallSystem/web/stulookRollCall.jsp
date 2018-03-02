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


<table id="list"></table>



<script type="text/javascript">
    $(function () {
        $('#list').datagrid({
            url:'/rollcall/findAllBySplitByStu',
            columns:[[
                {field:"id",title:"编号",width:150,align:'center'},
                {field:"sname",title:"姓名",width:150,align:'center'},
                {field:"sid",title:"学号",width:50,align:'center'},
                {field:"remarks",title:"备注",width:200,align:'center'},
                {field:"type",title:"类型",width:100,formatter:function (value,row,index) {
                    if(value ===1)return "全勤";
                    return value===2?"旷课":"请假";
                },align:'center'}
            ]],
            pagination:true,
            fit:true,
            singleSelect: true
        });


    })


</script>
</body>
</html>
