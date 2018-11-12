<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
     $(function () {
         $("#guru").edatagrid({
             height:320,
             url:"${pageContext.request.contextPath}/guru/findAllGuru",
             /*saveUrl:"${pageContext.request.contextPath}/back/guru/insertGuru",*/
             updateUrl:"${pageContext.request.contextPath}/guru/updateGuru",
             destroyUrl:"${pageContext.request.contextPath}/guru/deleteGuru",
             fit:true,               /*当设置为true的时候面板大小将自适应父容器。 */
             fitColumns:true,       //自动展示大小，适应网页宽度
             singleSelect:true,     //如果为true，则只允许选择一行。
             striped:true,          //是否显示斑马线效果。
             pagination:true,      //如果为true，则在DataGrid控件底部显示分页工具栏。
             checkOnSelect:false,  //如果为true，当用户点击行的时候该复选框就会被选中或取消选中。如果为false，当用户仅在点击该复选框的时候才会呗选中或取消。
             //销毁行的时候显示的确认对话框消息。
             destroyMsg:{
                 norecord:{    // 在没有记录选择的时候执行
                     title:'Warning',
                     msg:'No record is selected.'
                 },
                 confirm:{       // 在选择一行的时候执行		title:'Confirm',
                     msg:'Are you sure you want to delete?'
                 }
             },
             autoSave:true,       //设置为true时，在点击表格外部的时候自动保存编辑的行。

             view: detailview,
             detailFormatter: function(rowIndex, rowData){
                 return '<table><tr>' +
                     '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic +'" style="height:50px;"></td>' +
                     '<td style="border:0">' +
                     '<p>name: ' + rowData.name + '</p>' +
                     '<p>sex: ' + rowData.sex + '</p>' +
                     '</td>' +
                     '</tr></table>';
             },
             //在<div>标签上定义工具栏：
             toolbar:'#gurutb',
         });
     });
     //打开保存用户对话框函数
     function openSaveDialogGuru() {
         $("#saveDialogGuru").dialog({
             href:'${pageContext.request.contextPath}/back/guru/saveGuru.jsp',
             buttons:[{
                 iconCls:'icon-save',
                 text:'添加',
                 handler:function () {
                     $("#saveInputFormGuru").form('submit',{
                         url:'${pageContext.request.contextPath}/guru/insertGuru',
                         success:function (result) {
                             var resultObj=$.parseJSON(result);
                             if(resultObj.success){
                                 $.messager.show({title:'提示',msg:"用户添加信息成功！！"})
                             }else{
                                 $.messager.show({title:'提示',msg:"添加信息失败"})
                             }
                             $("#saveDialogGuru").dialog('close');
                             $("#guru").datagrid('reload');

                         }
                     });
                 }
             },{
                 iconCls:'icon-cancel',
                 text:"取消",
                 handler:function () {
                     $("#saveDialogGuru").dialog('close');
                 }
             }]
         });
     }

     function removeRowsGuru(){
         $('#guru').edatagrid('destroyRow');
     }




</script>
<table id="guru" title="上师详情">
        <thead>
        <tr>
                <th field="ss" data-options="checkbox:true"></th>

                <th field="name" width="100" editor="text">姓名</th>
                <th field="sex" width="100" align="left" editor="textbox">性别</th>
                <th field="status" width="50" editor="text">状态</th>
        </tr>
        </thead>
</table>

        <%--datagrid工具栏--%>
        <div id="gurutb">
                <a href="#" class="easyui-linkbutton" onclick="openSaveDialogGuru();" data-options="iconCls:'icon-add',plain:true">添加</a>
                <a href="#" class="easyui-linkbutton" onclick="removeRowsGuru()" data-options="iconCls:'icon-remove',plain:true">删除</a>
        </div>
<%--保存用户的对话框--%>
<div id="saveDialogGuru" data-options="draggable:true,iconCls:'icon-save',width:580,height:400,title:'添加用户信息'"></div>