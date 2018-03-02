<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2017/11/20
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style type="text/css">

</style>
  <script type="text/javascript">

  </script>
  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-form.js"></script>
</head>
<body>
  <form action="/login">
    <input type="text" name="tid">
    <input type="text" name="pwd">
    <input type="submit" value="提交">
  </form>

  <form action="/teacher/updateInfo">
    <input type="text" name="tid">
    <input type="text" name="tname">
    <input type="text" name="sex">

    <input type="text" name="pwd">
    <input type="text" name="id">
    <input type="submit" value="提交">
  </form>

  <form action="/teacher/addTeacher">
    <input type="text" name="tid">
    <input type="text" name="tname">
    <input type="text" name="sex">

    <input type="text" name="pwd">

    <input type="submit" value="提交">
  </form>

  <form action="/teacher/addStudent">
    <input type="text" name="sname">
    <input type="text" name="sid">
    <input type="text" name="account">

    <input type="text" name="pwd">
    <input type="text" name="sex">
    <input type="text" name="sclass">
    <input type="text" name="sgrade">

    <input type="submit" value="提交">
  </form>

  <form action="/teacher/deleteStudent">
    <input type="text" name="id">
    <input type="submit" value="提交">
  </form>


  <form id="test" action="/teacher/upClassTable" enctype="multipart/form-data" method="post">
    选择文件:<input data-role="none" type="file" name="file" width="120px">
    <input type="text" name="sclass">
    <input type="text" name="sgrade">
    <input type="submit">submit</input>
  </form>
  <script type="text/javascript">

      function testUpload(){
          var form = new FormData(document.getElementById("test"));

          $.ajax({
              url : "/teacher/upClassTable",
              data : form,
              type : 'post',
              processData:false,
              contentType:false,
              success : function(data){
                  alert("成功")
              },
              error : function(data){

              }
          });
      }
  </script>
</body>
</html>
