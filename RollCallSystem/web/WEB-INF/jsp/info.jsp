<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/25
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="../../eazyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../eazyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../eazyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../../eazyui/themes/icon.css">
    <link id="linkstyle" rel="stylesheet" type="text/css" href="../../eazyui/themes/default/easyui.css">
    <title>教师信息</title>
</head>
<body>
<div style="margin: 60px 200px auto 300px;">

    <form id = "editForm"  method = "post" style="margin: 50px 0 0 100px">
        <table class="table table-bordered" style="width: 350px">
            <input type="hidden" name = "id" id="id" value="${teacher.id}">

            <tr style="height: 30px;">
                <td>教师账号：
                    <%--<input  data-options="required:true," class="easyui-validatebox" type ="password" name ="name" />--%>
                    <input  type="text" id="tid" name="tid" class="easyui-textbox" data-options="iconCls:'icon-lock',required:true" value="${teacher.tid}">
                </td>

            </tr>
            <tr style="height: 30px">
                <td>姓 &nbsp &nbsp &nbsp 名：
                    <input  id = "tname" type="text" name="tname" class="easyui-textbox" data-options="iconCls:'icon-lock',required:true" value="${teacher.tname}">
                </td>
            </tr>

            <tr style="height: 30px">
                <td>我的密码：
                    <input id = "pwd"  type="password" name="pwd"class="easyui-textbox" data-options="iconCls:'icon-lock',required:true" value="${teacher.pwd}">
                </td>
            </tr>
            <tr style="height: 30px">
                <td>性别：
                    <select id="sex" class="easyui-combobox" data-options="editable:false,required:true"  name="sex" style="width:60px;">
                        <c:if test="${teacher.sex eq 1}">
                            <option value="1" selected >男</option>
                            <option value="2">女</option>
                        </c:if>
                        <c:if test="${teacher.sex eq 2}">
                            <option value="1"  >男</option>
                            <option value="2" selected>女</option>
                        </c:if>

                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <a style="margin: 15px 20px 15px 65px" id = "submitBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'保存',iconCls:'icon-save'"></a>

                    <a  style="margin: 15px auto 15px 65px"id = "resetBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'重置',iconCls:'icon-save'"></a>
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    function checkedPassword(){
        var id = $("#id").val();
        var tid = $("#tid").val();
        var tname = $("#tname").val();
        var pwd = $("#pwd").val();
        var sex = $("#sex").val();
        if(tid == null || tname == null||pwd ==null || sex ==null){
            $.messager.alert('输入错误','不能为空!','info');
            return false;
        }
       return true;

    }
    $(function () {
        //重置表单
        $("#resetBtn").click(function(){
            $("#editForm").form("reset");
        });
        //提交表单
        $("#submitBtn").click(function () {
            $('#editForm').form('submit', {
                url:"/teacher/updateInfo",
                onSubmit: function(){
                    var isValid = $(this).form('validate'); //判断表单是否无效
                    isValid = checkedPassword(); //检查输入的两次密码是否一样
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
                }
            });
        });
    });
</script>
</body>
</html>
