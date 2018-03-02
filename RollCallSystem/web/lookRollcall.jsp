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

<div id="toolbar">
    <a id = "removeBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'删除记录',iconCls:'icon-remove',plain:true"> </a>
</div>

<script type="text/javascript">
    $(function () {
        $('#list').datagrid({
            url:'/rollcall/findAllBySplit',
            columns:[[
                {field:"id",title:"编号",width:250,align:'center'},
                {field:"sname",title:"姓名",width:250,align:'center'},
                {field:"sid",title:"学号",width:150,align:'center'},
                {field:"remarks",title:"备注",width:300,align:'center'},
                {field:"type",title:"类型",width:100,formatter:function (value,row,index) {
                    return value===2?"旷课":"请假";
                },align:'center'}
            ]],
            pagination:true,
            toolbar:"#toolbar",
            fit:true,
            singleSelect: true
        });



        //删除
        $('#removeBtn').bind('click', function(){
            //拿到一个json的数组对象
            var stu = $('#list').datagrid('getSelections');
            if(!stu || stu.length == 0){
                $.messager.alert('错误提醒','请选择一条记录！','info');
                return false;
            }
            $.messager.confirm('确认','您确认想删除该记录吗？',function(r){
                if (r){
                    $.post('/rollcall/remove',{"id":stu[0].id},function (data) {
                        var data = eval('(' + data + ')');  // change the JSON string to javascript object
                        $.messager.show({
                            title:'消息',
                            msg:data.message,
                            timeout:3000,
                            showType:'slide',
                            height:120,
                            width:200
                        });
                    });
                    $('#list').datagrid('reload');//刷新表格
                }
            },'json');
        });


    })


</script>
</body>
</html>
