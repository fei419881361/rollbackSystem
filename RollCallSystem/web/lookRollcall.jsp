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

<div id="win" class="easyui-window" title="记录" style="width:600px;height:460px"
     data-options="iconCls:'icon-edit',modal:true,closed:true">
    <div align="center" style="padding-top: 20px">
        <form id = "editForm"  method = "post" enctype="multipart/form-data">
            <table >
                <!--提交修改的时候要传入-->
                <input type="hidden" name = "id" id = "id">

                <tr class="mTr">
                    <td>学号：</td><td><input  data-options="required:true,validType:'length[0,20]'" class="easyui-validatebox" type ="text" name ="sid" id="osid"/></td>
                </tr>
                <tr class="mTr">
                    <td>姓名：</td><td><input  data-options="required:true,validType:'length[0,20]'" class="easyui-validatebox" type ="text" name ="sname" id="osname"/></td>
                </tr>


                <tr class="mTr">
                    <td>目前状态：</td>
                    <td>
                        <select id="bState" class="easyui-combobox" data-options="required:true,editable:false "  name="type" style="width:220px;">
                            <option value="1" >全勤</option>
                            <option value="2">未到</option>
                            <option value="3">请假</option>
                        </select>
                    </td>
                </tr>

                <tr class="mTr">
                    <td>备注：</td><td><textarea name="remarks" style="width: 220px;height:100px" id="oremarks"></textarea></td>
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
    <a id = "removeBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'删除记录',iconCls:'icon-remove',plain:true"> </a>
    <a id = "updateBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'修改记录',iconCls:'icon-edit',plain:true"> </a>
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
                        $('#list').datagrid('reload');//刷新表格
                    });

                }
            },'json');
        });


        $("#updateBtn").click(function () {

            var rc = $('#list').datagrid('getSelected');
            if(!rc){
                $.messager.alert('错误提醒','请选择一条记录！','info');
                return false;
            }
            console.log(rc);
            $("#id").val(rc.id);
            $("#osname").val(rc.sname);
            $("#osid").val(rc.sid);
            $("#oremarks").val(rc.remarks);
            $('#bState').combobox("enable");
            $("#win").window("open");
        });

        //点击弹框确认
        $("#submitBtn").click(function () {
            $('#editForm').form('submit', {
                url:"/rollcall/update",
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
    })


</script>
</body>
</html>
