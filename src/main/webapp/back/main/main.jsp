<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/script/datagrid-cellediting.js"></script>
    <script type="text/javascript">

	<!--菜单处理-->
    $(function () {
        if(${sessionScope.admin==null}){
            location.href="${pageContext.request.contextPath}/back/admin/login.jsp";
        }
        $.post("${pageContext.request.contextPath}/menu/showMenu", function (menu) {
            /*if(admin=="null"){
                location="${pageContext.request.contextPath}/back/admin/login.jsp";
            }*/

            $.each(menu,function (index,m) {
                var content="<div style='text-align:center'>";
                $.each(m.menus,function(idx,child){
                    content +="<a onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width: 96%;height:36px;margin:10px 0px;border:2px solid #c8d47b' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.title+"</a></br>";

                });
                        content +="</div>";
                $("#menu").accordion('add', {
                    title:m.title,
                    iconCls:m.iconCls,
                    content:content,
                });
            });

        });
    });
	function addTabs(title,iconCls,href) {
        if(!$("#tabs").tabs('exists',title)){
            $("#tabs").tabs('add',{
                title:title,
                iconCls:iconCls,
                href:"${pageContext.request.contextPath}/"+href,
                fit:true,
                closable:true,
            });
        }else{
            $("#tabs").tabs('select',title);
        }
    }
    //打开修改用户密码的对话框
    function openUpdatePwd() {
        $("#editDialogPwd").dialog({
            href:'${pageContext.request.contextPath}/back/admin/editAdmin.jsp?id='+${sessionScope.admin.id},
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function () {
                        $("#editInputFormAdmin").form('submit',{
                            url:"${pageContext.request.contextPath}/admin/updatePwd",
                            success:function (result) {
                                var resultObj=$.parseJSON(result);
                                if(resultObj.success){
                                    alert("修改成功，请重新登录");
                                    location="${pageContext.request.contextPath}/admin/exitLogin";
                                }else{
                                    $.messager.show({title:'提示',msg:resultObj.messager})
                                }
                                $("#editDialogPwd").dialog('close');
                                $("#dg").datagrid('reload');

                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:"取消",
                    handler:function () {
                        $("#editDialogPwd").dialog('close');
                    }
                },
            ]
        });
    }
</script>

</head>
<body class="easyui-layout">
        <%--页面的头部部分--%>
        <div data-options="region:'north'   ,split:true" style="height:60px;background-color:  #5C160C">
            <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
            <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 360px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.name} &nbsp;<a href="#" class="easyui-linkbutton"  onclick="openUpdatePwd()" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/exitLogin" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
        </div>
        <%--更新密码对话框--%>
        <div id="editDialogPwd" data-options="draggable:false,iconCls:'icon-edit',width:520,height:360,title:'更新用户信息'">
        </div>
        <%--页面的尾部分--%>
        <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
            <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
        </div>

        <%--页面的左侧位置--%>
        <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
            <div id="menu" class="easyui-accordion" data-options="fit:true">

            </div>
        </div>

        <%--页面的中间部分--%>
        <div data-options="region:'center'">
            <div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
                <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
            </div>
        </div>
</body> 
</html>