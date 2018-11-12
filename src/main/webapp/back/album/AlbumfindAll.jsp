<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
     $(function () {
         $("#album").treegrid({
             height:500,
             fit:true,
             fitColumns:true,//自动展示大小，适应网页宽度
             url:'${pageContext.request.contextPath}/album/showAllAlbum',
             idField:'id',
             treeField:'title',
             pagination:true,//显示分页工具栏
             columns:[[
                 {title:'名字',field:'title',width:140},
                 {field:'duration',title:'时长',width:80,align:'right'},
                 {field:'size',title:'大小',width:60},
                 {field:'uploadTime',title:'上传时间',width:120}
             ]],
             //在<div>标签上定义工具栏：
             toolbar:"#albumtb",
         });
     });
     //添加专辑
     function openSaveDialogAlbum() {

             $("#saveDialogAlbum").dialog({
                 href:'${pageContext.request.contextPath}/back/album/saveAlbum.jsp',
                 buttons:[{
                     iconCls:'icon-save',
                     text:'添加',
                     handler:function () {
                         $("#saveInputFormAlbum").form('submit',{
                             url:'${pageContext.request.contextPath}/album/insertAlbum',
                             success:function (result) {
                                 var resultObj=$.parseJSON(result);
                                 if(resultObj.success){
                                     $.messager.show({title:'提示',msg:"添加专辑成功！！"})
                                 }else{
                                     $.messager.show({title:'提示',msg:"添加失败"})
                                 }
                                 $("#saveDialogAlbum").dialog('close');
                                 $("#album").datagrid('reload');

                             }
                         });
                     }
                 },{
                     iconCls:'icon-cancel',
                     text:"取消",
                     handler:function () {
                         $("#saveDialogAlbum").dialog('close');
                     }
                 }]
             });

     }
     //添加章节
     function openSaveDialogChapter() {
         var albums=$("#album").datagrid('getSelected');
         /*if (albums.id!=null){*/
         if(albums==null){
             $.messager.show({title:'提示',msg:"选择一行专辑"});
         }else if(albums.id!=null){
         $("#saveDialogChapter").dialog({
             href:'${pageContext.request.contextPath}/back/album/saveChapter.jsp?id='+albums.id,
             buttons:[{
                 iconCls:'icon-save',
                 text:'添加',
                 handler:function () {
                     $("#saveInputFormChapter").form('submit',{
                         url:'${pageContext.request.contextPath}/chapter/insertChapter',
                         success:function (result) {
                             var resultObj=$.parseJSON(result);
                             if(resultObj.success){
                                 $.messager.show({title:'提示',msg:"添加章节成功！！"})
                             }else{
                                 $.messager.show({title:'提示',msg:"添加失败"})
                             }
                             $("#saveDialogChapter").dialog('close');
                             $("#album").datagrid('reload');

                         }
                     });
                 }
             },{
                 iconCls:'icon-cancel',
                 text:"取消",
                 handler:function () {
                     $("#saveDialogChapter").dialog('close');
                 }
             }]
         });
         }
        /* }else if (albums==null) {
             $.messager.show({title:'提示',msg:"选择一行专辑"})
         }*/
     }

     //下载音频
     function downloadAudio() {
         var albums=$("#album").datagrid('getSelected');
        if(albums==null){
            $.messager.show({title:'提示',msg:"选择一行专辑"})
        }else{
         $("#openDialogAudio").dialog({
             href:'${pageContext.request.contextPath}/back/album/downloadAudio.jsp?id='+albums.id,
             buttons:[{
                 iconCls:'icon-undo',
                 text:'下载',
                 handler:function () {
                     $("#downAudio").form('submit',{
                         url:'${pageContext.request.contextPath}/chapter/download',
                         success:function (result) {
                             var resultObj=$.parseJSON(result);
                             if(resultObj.success){
                                 $.messager.show({title:'提示',msg:"下载音频成功！！"})
                             }else{
                                 $.messager.show({title:'提示',msg:"下载失败"})
                             }
                             $("#openDialogAudio").dialog('close');
                             $("#album").datagrid('reload');

                         }
                     });
                 }
             },{
                 iconCls:'icon-cancel',
                 text:"取消",
                 handler:function () {
                     $("#openDialogAudio").dialog('close');
                 }
             }]
         });
        }
     }
</script>
<table id="album" ></table>
<%--datagrid工具栏--%>
<div id="albumtb">
        <a href="#" class="easyui-linkbutton" onclick="openAlbumDetails();" data-options="iconCls:'icon-tip',plain:true">专辑详情</a>
        <a href="#" class="easyui-linkbutton" onclick="openSaveDialogAlbum();" data-options="iconCls:'icon-save',plain:true">添加专辑</a>
        <a href="#" class="easyui-linkbutton" onclick="openSaveDialogChapter();" data-options="iconCls:'icon-save',plain:true">添加章节</a>
        <a href="#" class="easyui-linkbutton" onclick="downloadAudio()" data-options="iconCls:'icon-undo',plain:true">下载音频</a>
</div>
<%--添加专辑的对话框--%>
<div id="saveDialogAlbum" data-options="draggable:true,iconCls:'icon-save',width:580,height:400,title:'添加专辑'"></div>
<%--添加章节的对话框--%>
<div id="saveDialogChapter" data-options="draggable:true,iconCls:'icon-save',width:580,height:400,title:'添加章节'"></div>
<%--下载音频的对话框--%>
<div id="openDialogAudio" data-options="draggable:true,iconCls:'icon-save',width:520,height:320,title:'下载音频'"></div>

