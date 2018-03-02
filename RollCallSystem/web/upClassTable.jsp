<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/27
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <script type="text/javascript" src="eazyui/jquery.min.js"></script>
        <script type="text/javascript" src="eazyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="eazyui/locale/easyui-lang-zh_CN.js"></script>
        <link rel="stylesheet" type="text/css" href="eazyui/themes/icon.css">
        <link id="linkstyle" rel="stylesheet" type="text/css" href="eazyui/themes/default/easyui.css">
        <title></title>
    </head>
</head>
<body>
<div style="margin: 60px 200px auto 300px;">
    <form id = "editForm"  method = "post" style="margin: 50px 0 0 100px" enctype="multipart/form-data">
        <table class="table table-bordered" style="width: 350px">

            <tr style="height: 60px;">
                <td>班级：
                    <input  type="text" id="sclass" name="sclass" class="easyui-textbox" data-options="required:true">
                </td>

            </tr>
            <tr style="height: 60px">
                <td>年级：
                    <input  id = "sgrade" type="text" name="sgrade" class="easyui-textbox" data-options="required:true">
                </td>
            </tr>

            <tr style="height: 60px">
               <td>&nbsp;&nbsp;<input class="easyui-filebox" data-options="buttonText:'选择课表'" name="file"/></td>
            </tr>

            <tr style="height: 60px">
                <td>
                    <a style="margin: 15px 20px 15px 65px" id = "submitBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'上传',iconCls:'icon-ok'"></a>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function checkedPassword(){
            var sclass = $("#sclass").val();
            var sgrade = $("#sgrade").val();

            if(sclass == null || sgrade == null){
                $.messager.alert('输入错误','不能为空!','info');
                return false;
            }
            return true;
        }
        $(function () {
            var form = new FormData(document.getElementById("editForm"));
            $("#submitBtn").click(function () {
                $('#editForm').form('submit', {
                    url:"/teacher/upClassTable",
                    data:form,
                    onSubmit: function(){
                        var isValid = $(this).form('validate'); //判断表单是否无效
                        isValid = checkedPassword();
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
        })
    </script>
</div>
</body>
</html>
