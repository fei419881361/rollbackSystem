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
<!--表单弹出层-->
<div id="win" class="easyui-window" title="增加学生" style="width:350px;height:260px"
     data-options="iconCls:'icon-edit',modal:true,closed:true">
    <div align="center" style="padding-top: 20px">
        <form id = "editForm"  method = "post" enctype="multipart/form-data">
            <table >
                <!--提交修改的时候要传入-->
                <%--<input type="hidden" name = "sid" id = "sid">--%>
                <%--<input type="hidden" name = "sname" id = "sname">--%>
                <%--<input type="hidden" name = "sclass" id = "sclass">--%>
                <%--<input type="hidden"  id = "sgrade" name = "sgrade">--%>

                <tr class="mTr">
                    <td>学号：</td><td><input id="oSid"  data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="text" name ="sid" /></td>
                </tr>

                <tr class="mTr">
                    <td>姓名：</td><td><input id="oSname"  data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="text" name ="sname" /></td>
                </tr>

                <tr class="mTr">
                    <td>班级：</td><td><input id="oSclass" data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="text" name ="sclass" /></td>
                </tr>

                <tr class="mTr">
                    <td>年级：</td><td><input id="oSgrade" data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="text" name ="sgrade" /></td>
                </tr>
                <tr class="mTr">
                    <td>初始账号：</td><td><input id="oSaccount" data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="text" name ="account" /></td>
                </tr>
                <tr class="mTr">
                    <td>初始密码：</td><td><input id="oSpwd"  data-options="required:true,validType:'length[0,30]'" class="easyui-validatebox" type ="password" name ="pwd" /></td>
                </tr>
                <tr class="mTr">
                <td>性别：</td>
                <td>
                    <select id="oSex" class="easyui-combobox" data-options="editable:false,required:true"  name="sex" style="width:60px;">
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </td>
                </tr>
                <tr class="mTr">
                    <td>
                        <a id = "submitBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'保存',iconCls:'icon-save',plain:true"/>
                        <a id = "resetBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'重置',iconCls:'icon-save',plain:true"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>





    <table id="list"></table>

    <div id="toolbar">
        <a id = "addBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'添加学生',iconCls:'icon-add',plain:true"> </a>
        <a id = "removeBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'移除学生',iconCls:'icon-remove',plain:true"> </a>
    </div>

<script type="text/javascript">
    $(function () {
        $('#list').datagrid({
            url:'/student/findAllBySplit',
            columns:[[
                {field:"sid",title:"学号",width:250,align:'center'},
                {field:"sname",title:"姓名",width:250,align:'center'},
                {field:"sclass",title:"班级",width:250,align:'center'},
                {field:"sgrade",title:"年级",width:250,align:'center'},
                {field:"sex",title:"性别",width:150,formatter:function (value,row,index) {
                    return value===1?"男":"女";
                },align:'center'}
            ]],
            pagination:true,
            toolbar:"#toolbar",
            fit:true,
            singleSelect: true
        });
        //增加学生按钮
        $("#addBtn").click(function () {
            $("#editForm").form("clear");
            $("#win").window("open");
        });
        //提交增加学生表单
        $("#submitBtn").click(function () {
            $('#editForm').form('submit', {
                url:"/teacher/addStudent",

                onSubmit: function(){
                    var isValid = $(this).form('validate'); //判断表单是否无效
                    return isValid;	// 返回false终止表单提交
                },

                success:function(data){
                    var data = eval('(' + data + ')');  // change the JSON string to javascript object
                    $.messager.show({
                        title:'消息',
                        msg:data.message,
                        timeout:3000,
                        showType:'slide',
                        height:120,
                        width:200
                    });
                    $('#list').datagrid('reload');//刷新表格
                    $("#win").window("close");
                }
            });
        });
        //reset
        $("#resetBtn").click(function () {
            $("#editForm").form("reset");
        });
        //删除
        $('#removeBtn').bind('click', function(){
            //拿到一个json的数组对象
            var stu = $('#list').datagrid('getSelections');
            if(!stu || stu.length == 0){
                $.messager.alert('错误提醒','请选择一个学生！','info');
                return false;
            }
            $.messager.confirm('确认','您确认想删除该学生吗？',function(r){
                if (r){
                    $.post('/student/remove',{"id":stu[0].id},function (data) {
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
