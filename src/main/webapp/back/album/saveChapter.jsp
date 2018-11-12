<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center;">
    <form id="saveInputFormChapter" class="easyui-form" method="post" enctype="multipart/form-data">

        <input type="hidden" name="album_id" value="${param.id}" class="easyui-textbox">

        <div style="margin-top: 20px">
            文件：<input name="file" class="easyui-filebox" data-options="buttonText:'上传'">
        </div>


    </form>
</div>