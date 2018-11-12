<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
</head>
<body>

</body>
        <div style="text-align: center;">
            <h2 style="text-align: center">注册用户</h2>
       <form action="${pageContext.request.contextPath}/user/regist" method="post">
           <div style="margin-top: 58px">
           用户名  <input type="text" class="easyui-textbox" name="username"><br>
           </div>
           <div style="margin-top: 20px">
           密码：  <input type="text" class="easyui-textbox" name="password"><br>
           </div>
               <div style="margin-top: 20px">
           性别：  <input type="text" class="easyui-textbox" name="sex"><br>
               </div>
           <div style="margin-top: 20px">
           生日：  <input type="text" class="easyui-datebox" name="birthday"><br>
           </div>
           <div style="margin-top: 20px">
                    <input type="submit" value="提交">
           </div>
       </form>
        </div>
</html>