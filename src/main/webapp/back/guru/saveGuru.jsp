<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveInputFormGuru" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 58px">
            名字：<input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px">
            头像：<input name="file" class="easyui-filebox" data-options="buttonText:'上传'">
        </div>
        <div style="margin-top: 20px">
           性别：<input type="text" name="sex" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px">
            状态：<input type="text" name="status" class="easyui-textbox" >
        </div>

    </form>
</div>