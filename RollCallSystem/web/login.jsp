<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/28
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="eazyui/jquery.min.js"></script>
    <script type="text/javascript" src="eazyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="eazyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="eazyui/themes/icon.css">
    <link id="linkstyle" rel="stylesheet" type="text/css" href="eazyui/themes/default/easyui.css">
    <meta charset="UTF-8" >
    <link href="css/login.css" rel="stylesheet">
    <title>登录页面</title>
</head>
<body onload="onLoad();">
<div class = "topDiv">
    <div class="secondDiv"><!-- 覆盖个div，添加透明度 -->
        <br>
        <p align="center" class="loginTitle" style="margin-bottom: 5px;"><font color="#4ac9ff">Teacher</font><font color="#ff508b">RollCall</font></p>
        <p align="center" class="slogan" style="margin-bottom: 30px;">课堂点到系统</p>
        <form action="/login" method="post" onsubmit="return submitForm();">
            <div class="formDiv">
                <table cellpadding="5" cellspacing="10">
                    <tr >
                        <td colspan="2" align="center">
                            <img width="100" src="images/login/bike.png">
                        </td>
                    </tr>
                    <tr height="50">
                        <td >
                            <img width="30" align="center" src="images/login/name.png"> 登录账号：
                        </td>
                        <td>
                            <input  class="form-control" placeholder="请输入账号" onblur="checkUsername()" style="width: 190px; height: 35px;" type="text" id = "username" name="aUsername" />
                        </td>
                    </tr>
                    <tr height="50">
                        <td>
                            <img width="30" align="center" src="images/login/pwd.png"> 密 码:
                        </td>
                        <td>
                            <input class="form-control" placeholder="请输入密码" onblur="checkPassword()" type="password" id = "password" name="aPassword" style="width: 190px; height: 35px;">
                        </td>
                    </tr>
                    <tr height="50">
                        <td>
                            <img width="30" src = "images/login/checkcode.png"/>&nbsp;验证码：
                        </td>
                        <td>
                            <input class="col-sm-4 form-control" placeholder="验证码" type="text" onblur="checkRandomCode()" id ="randomCodeByInput"  style="width: 70px; height: 25px;">
                            &nbsp;&nbsp;
                            <!--用来显示随机数的label-->
                            <label id = "codeLabel" style ="height: 25px;width:50px;background-color: rgb(200,200,200);"></label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0);"  onclick="reRandomCode();"><img alt="" src="images/login/refresh.png"></a>
                        </td>
                    </tr>
                    <tr height="50">
                        <td >
                            <input type="image" value="登陆" class="btn btn-default" src="images/login/login.png" width="70" >
                        </td>
                        <td>
                            <font color = "red">
                                <c:if test="${not empty msg }">
                                    <label id = "msgSpan">${msg}&nbsp;(T ^ T)</label>
                                </c:if>
                                <c:if test="${empty msg}">
                                    <label id = "msgSpan">(≧∇≦)ﾉ&nbsp;&nbsp;点我登陆哦~</label>
                                </c:if>
                            </font>
                            <a href="register.jsp">学生注册</a>
                        </td>
                    </tr>
                </table>
            </div>
            <!--尾注-->
            <p align="center" style="color:#7f7f7f;position: absolute;top: 95%;right: 1%">copyright@2018</p>

        </form>
    </div>
</div>
</body>
<!-- do -->
<script src="js/validate.js"></script>
<script type="text/javascript">
    //加载验证码
    function onLoad(){
        var codeLabel =  document.getElementById("codeLabel");//加载窗口的时候加载
        codeLabel.innerHTML= createRandomCode() ;
    }
</script>
</html>
