<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveInputFormBanner" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 58px">
            名字：<input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px">
            图片：<input name="file" class="easyui-filebox" data-options="buttonText:'上传'">
        </div>
        <div style="margin-top: 20px">
            描述：<input type="text" name="description" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px">
            状态：<input type="text" name="status" class="easyui-textbox" >
        </div>
        <%--<div style="margin-top: 20px">
            时间：<input type="text" name="cretime" class="easyui-datebox" >
        </div>--%>
    </form>
</div>