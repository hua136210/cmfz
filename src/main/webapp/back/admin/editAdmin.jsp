<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#editInputFormAdmin").form('load','${pageContext.request.contextPath}/admin/findOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="editInputFormAdmin" class="easyui-form" method="post">
           <input type="hidden" name="id" value="${param.id}">
                <div style="margin-top: 58px">
                    用户名：<input type="text" name="name" class="easyui-textbox" data-options="iconCls:'icon-man',readonly:true">
                </div>
                <div style="margin-top: 20px">
                    密&nbsp;&nbsp;码：<input type="password" name="password" class="easyui-textbox" prompt="Password"/>
                </div>


    </form>
</div>