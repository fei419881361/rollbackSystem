<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/27
  Time: 8:52
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
<div style="margin: 60px 200px auto 300px;">

    <form id = "editForm"  method = "post" style="margin: 50px 0 0 100px">
    <table class="table table-bordered" style="width: 350px">

        <tr style="height: 30px;">
            <td>班级：
                <%--<input  data-options="required:true," class="easyui-validatebox" type ="password" name ="name" />--%>
                <input  type="text" id="sclass" name="sclass" class="easyui-textbox" data-options="required:true">
            </td>

        </tr>
        <tr style="height: 30px">
            <td>年级：
                <input  id = "sgrade" type="text" name="sgrade" class="easyui-textbox" data-options="required:true">
            </td>
        </tr>

        <tr>
            <td>
                <a style="margin: 15px 20px 15px 65px" id = "submitBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'开始点到',iconCls:'icon-ok'"></a>

                <a  style="margin: 15px auto 15px 65px"id = "resetBtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="text:'重置',iconCls:'icon-reload'"></a>
            </td>
        </tr>
    </table>
</form>

    <form id = "editstu"  method = "post" style="margin: 50px 0 0 100px">
        <table class="table table-bordered" style="width: 350px">

            <tr style="height: 30px;">
                <td>
                    <div>姓名：<label id="sname"></label></div>
                </td>

            </tr>
            <tr style="height: 30px">
                <td>
                    <div>学号：<label id="sid"></label></div>
                </td>
            </tr>

            <tr style="height: 30px">
                <td>&nbsp;&nbsp;到：
                    <input type="radio" name="radio" value="1"/>
                    未到：
                    <input type="radio" name="radio" value="2"/>
                    请假：
                    <input type="radio" name="radio" value="3"/>
                </td>
            </tr>

            <tr style="height: 30px">
                <td>备注：
                    <textarea name="remarks" id="remarks" cols="30" rows="5"></textarea>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>
                    <input type="button" id="finish" value="结束点到" onclick="finishRollCall()">
                    <input type="button" id="next" value="下一个" onclick=nextStu()>
                </td>
            </tr>
        </table>
    </form>

    <form id = "result"  method = "post" style="margin: 50px 0 0 100px">
        <table class="table table-bordered" style="width: 350px">

            <tr style="height: 30px;">
                <td>
                    <div>总人数：<label id="total"></label></div>
                </td>

            </tr>
            <tr style="height: 30px">
                <td>
                    <div>请假人数：<label id="qj"></label></div>
                </td>
            </tr>
            
            <tr style="height: 30px">
                <td>
                    <div>缺席人数：<label id="qx"></label></div>
                </td>
            </tr>

            

           
            <tr style="height: 30px">
                <td>
                    <input type="button" id="qr" value="确认" onclick="endRollCall()">
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    window.onload = function () {
        $("#editstu").hide();
        $("#result").hide();
    }
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
        //重置表单
        $("#resetBtn").click(function(){
            $("#editForm").form("reset");
        });
        //提交表单
        $("#submitBtn").click(function () {
            $('#editForm').form('submit', {
                url:"/student/getclassstudent",
                onSubmit: function(){
                    var isValid = $(this).form('validate'); //判断表单是否无效
                    isValid = checkedPassword();
                    return isValid;	// 返回false终止表单提交
                },
                success:function(data){
                    var student = eval('(' + data + ')');  // change the JSON string to javascript object
                    total = student.total;
                    students = student.students;
                    rollcall();
                    point = 0;
                }
            });
        });
    });
    var total ;
    var students;
    var rc = [];
    var point =0//数组位移指针
    function rollcall() {
        $("#editForm").hide();
        $("#editstu").show();

        document.getElementById("sid").innerHTML=students[point].sid;
        document.getElementById("sname").innerHTML=students[point].sname;
        point++;
    }
    function nextStu() {
        if((point+1) > total){
            alert("点到结束");
            $('#editstu').hide();
            $('#result').show();
            document.getElementById("total").innerHTML=total;
            let qj = 0; let qx = 0;
            for (let i =0 ; i<rc.length;i++){
                if(rc[i].type == 2){
                    qx ++ ;
                }else if(rc[i].type == 3){
                    qj ++;
                }
            }
            document.getElementById("qj").innerHTML=qj;
            document.getElementById("qx").innerHTML=qx;

        }else {

            let obj = {};
            var type = $("input[name='radio']:checked").val();
            obj.type = type;
            obj.sname = document.getElementById("sname").innerHTML;
            obj.sid = document.getElementById("sid").innerHTML;
            obj.remarks = $('#remarks').val();
            $('#remarks').val("");
            console.log(obj);
            rc.push(obj);
            document.getElementById("sid").innerHTML=students[point].sid;
            document.getElementById("sname").innerHTML=students[point].sname;
            point ++
            console.log(rc.length)
        }
    }
    function finishRollCall() {
        $.messager.confirm('确认','确认结束点到吗？',function(r){
            if (r){
                $("#editstu").hide();
                $('#editstu').hide();
                $('#result').show();
                document.getElementById("total").innerHTML=total;
                let qj = 0; let qx = 0;
                for (let i =0 ; i<rc.length;i++){
                    if(rc[i].type == 2){
                        qx ++ ;
                    }else if(rc[i].type == 3){
                        qj ++;
                    }
                }
                document.getElementById("qj").innerHTML=qj;
                document.getElementById("qx").innerHTML=qx;
                $("#result").show();
            }
        },'json');
    }
    //结束点到按钮
    function endRollCall() {
        $.ajax({
            type:'post',
            url:'/rollcall/endrollcall',
            data:{"rc":JSON.stringify(rc)},
            success:function (data) {
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

        $("#editForm").show();
        $("#editstu").hide();
        $("#result").hide();
        rc = {};
        total = 0;
        students = [];
    }

</script>
</body>
</html>
