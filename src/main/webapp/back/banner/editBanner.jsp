<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#editInputFormB").form('load','${pageContext.request.contextPath}/banner/findOneBanner?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="editInputFormB" class="easyui-form" method="post" enctype="multipart/form-data">
           <input type="hidden" name="id" value="${param.id}">
                <div style="margin-top: 58px">
                    名字：<input type="text" name="title" class="easyui-textbox">
                </div>
                <div style="margin-top: 20px">
                    路径：<input name="file"  class="easyui-filebox" data-options="buttonText:'上传'">
                </div>
                <div style="margin-top: 20px">
                    描述：<input type="text" name="description" class="easyui-textbox" >
                </div>
                <div style="margin-top: 20px">
                    状态：<input type="text" name="status" class="easyui-textbox" >
                </div>


    </form>
</div>