<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveInputFormAlbum" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 58px">
            名字：<input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px">
            级数：<input type="text" name="count" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px">
            封面：<input name="file" class="easyui-filebox" data-options="buttonText:'上传'">
        </div>
        <div style="margin-top: 20px">
            星级：<input type="text" name="star" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px">
            作者：<input type="text" name="author" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px">
            播音：<input type="text" name="broadCast" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px">
            内容简介：<input type="text" name="brief" class="easyui-textbox" >
        </div>

    </form>
</div>