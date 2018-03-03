<%--
  Created by IntelliJ IDEA.
  User: 41988
  Date: 2018/2/22
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../../eazyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../eazyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../eazyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../../eazyui/themes/icon.css">
    <link id="linkstyle" rel="stylesheet" type="text/css" href="../../eazyui/themes/default/easyui.css">
    <style type="text/css">
        ul{
            line-height: 30px;
        }
    </style>
    <title>hello</title>
</head>
<body class="easyui-layout">
<div data-options="region:'north' , split:true"style="height:85px">
    <div style="margin: 0px 50px;" >
        <img  src="images/login/bike.png" height="75px">
    </div>
    <div style="position:absolute; left: 35%;top: 5px">
        <p  style="font-family: MyNewFont"><font color="#4ac9ff" size="5px">Student</font><font size="5px" color="#ff508b">RollCall</font><font color="#" size="4px">&nbsp;课堂点到管理系统</font></p>
    </div>
    <div id="loginDiv" style="position:absolute;right:10px;top:10px">
        欢迎你登录,${student.sname}同学
    </div>
    <div id="changestyle" style="position: absolute; right: 20px; top:30px">
        <a href="javascript:void(0)" id="edit" class="easyui-menubutton" data-options="menu:'#stylemenu',iconCls:'icon-edit'">切换风格</a>
        <div id="stylemenu" style="width:150px">
            <div>default</div>
            <div>gray</div>
            <div>black</div>
            <div>bootstrap</div>
            <div>material</div>
            <div>metro</div>
        </div>
    </div>
</div>
<div data-options="region:'west' , title:'系统菜单' , split:true " style="width:200px">
    <div id="aa" data-options="border:0 , multiple:true" class="easyui-accordion" style="width: 193px;">
        <div title="点到记录" data-options="iconCls:'icon-save'"style="overflow: auto;padding: 10px">
            <ul>
                <li><a href="javascript:void(0)" pageUrl="stulookRollCall.jsp">查看点到记录</a></li>
            </ul>
        </div>

        <div title="学生课表" data-options="iconCls:'icon-reload'" style="overflow: auto;padding: 10px">
            <ul>
                <li><a href="javascript:void(0)" pageUrl="lookClassTable.jsp">查看课表</a></li>
            </ul>
        </div>

        <div title="个人管理" data-options="iconCls:'icon-reload'" style="overflow: auto;padding: 10px">
            <ul>
                <li><a href="javascript:void(0)" pageUrl="rePassword.jsp">修改密码</a></li>
            </ul>
        </div>
    </div>
</div>

<div data-options="region:'center'  , split:true" style="padding:5px;background: #eee">
    <div id="center_tabs" class="easyui-tabs" style="width:500px;height: 250px" data-options="fit:true">
        <div title="起始页" style="padding:20px;display: none">
            <h1>欢迎登录点到管理系统</h1>
        </div>
    </div>
</div>

<div data-options="region:'south' ,split:true"style="width:200px">
    <div class="copyrightDiv" style="text-align:center">
        课堂点到系统&copy;2018版权所有
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("a[pageUrl]").click(function () {
            var pageUrl = $(this).attr("pageUrl");
            //获取a标签内容，标题
            var title = $(this).text();
            //判断是否存在选项卡
            if($("#center_tabs").tabs("exists",title)){
                $("#center_tabs").tabs("select",title)
            }else {
                $("#center_tabs").tabs("add",{
                    title:title,
                    content:"<iframe  frameborder ='0' width = '100%' height= '99%' src='"+pageUrl+"'></iframe>",
                    closable:true,
                    fit:true,
                    tools:[{
                        iconCls:'icon-mini-refresh',
                        handler:function(){
                            alert('refresh');
                        }
                    }]
                })
            }
        })

        $('#stylemenu').menu({
            onClick:function (item) {
                var stylename = item.text;
                var href = $('#linkstyle').attr('href')
                //eazyui/themes/default/easyui.css
                href = href.substring(0,href.indexOf('themes'))+'themes/'+stylename+'/easyui.css';
                $('#linkstyle').attr('href',href);
            }
        })
    })


</script>

<script type="text/javascript">
    $(function () {
        $('#myDiv').window({
            title:'title',
            width:'100',
            height:'100'
        })
    });

    $(document).ready(function () {
        $(function () {
            $('#pp').pagination({
                total:100,
                pageSize:20,
                pageNumber:2,
                pageList:[5,10,20]
            });
        });
        $('#btn').click(function () {
            $('#pp').pagination({
                onSelectPage:function (pageNumber, pageSize) {
                    alert(pageNumber+pageSize);
                }
            })
        });
    })


</script>
</body>
</html>
