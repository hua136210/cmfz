<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
     $(function () {
         $("#banner").datagrid({
             height:320,
             url:"${pageContext.request.contextPath}/banner/findAll",
             fit:true,
             fitColumns:true,//自动展示大小，适应网页宽度
             pagination:true,//显示分页工具栏
             pageSize:6,
             pageList:[6,12,18,24,30],
             ctrlSelect:true,
             columns:[[
                 {title:"cks",field:"cks",checkbox:true},

                 {title:"名字",field:"title",width:120,align:'center'},

                 {title:"描述",field:"description",width:120,align:'center'},
                 {title:"状态",field:"status",width:120,align:'center'},
                 {title:"时间",field:"cretime",width:120,align:'center'},
                 {title:"options",field:"options",width:150,
                     formatter:function (value,row,index) {
                         return "<a href='javascript:;' class='options' onclick=\"deRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                             "<a href='javascript:;' class='options' onclick=\"openUpdate('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                     }
                 }
             ]],
             view: detailview,
             detailFormatter: function(rowIndex, rowData){
                 return '<table><tr>' +
                     '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath +'" style="height:50px;"></td>' +
                     '<td style="border:0">' +
                     '<p>description: ' + rowData.description + '</p>' +
                     '<p>Status: ' + rowData.status + '</p>' +
                     '</td>' +
                     '</tr></table>';
             },

             //在数据加载成功的时候触发
             onLoadSuccess:function () {
                 $(".options").linkbutton();
             },
             //在<div>标签上定义工具栏：
             toolbar:"#tb",
         });
     });
     //删除一行的事件
        function deRow(id) {
            $.post("${pageContext.request.contextPath}/banner/delete",
                        {"id":id},
                        function (result) {
                $("#banner").datagrid('reload');
            });
        }
     // 打开修改的对话框
        function openUpdate(id){
            $("#editDialogBanner").dialog({
                href:'${pageContext.request.contextPath}/back/banner/editBanner.jsp?id='+id,
                buttons:[{
                    iconCls:'icon-edit',
                    text:"修改",
                    handler:function () {
                        $("#editInputFormB").form('submit',{
                            url:"${pageContext.request.contextPath}/banner/updateBanner",
                            success:function (result) {
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:"用户修改信息成功！！！"})
                                }else{
                                    $.messager.show({title:'提示',msg:"修改失败"})
                                }
                                $("#editDialogBanner").dialog('close');
                                $("#banner").datagrid('reload')
                            }
                        })
                    }
                },
                    {
                                iconCls:'icon-cancel',
                                text:"取消",
                                handler:function () {
                                    $("#editDialogBanner").dialog('close');
                                }
                    }
                ]
            })
        }
     //打开保存用户对话框函数
     function openSaveDialogBanner() {
         $("#saveDialogBanner").dialog({
             href:'${pageContext.request.contextPath}/back/banner/saveBanner.jsp',
             buttons:[{
                 iconCls:'icon-save',
                 text:'添加',
                 handler:function () {
                     $("#saveInputFormBanner").form('submit',{
                         url:'${pageContext.request.contextPath}/banner/addBanner',
                         success:function (result) {
                             var resultObj=$.parseJSON(result);
                             if(resultObj.success){
                                 $.messager.show({title:'提示',msg:"用户添加信息成功！！"})
                             }else{
                                 $.messager.show({title:'提示',msg:resultObj.messager})
                             }
                             $("#saveDialogBanner").dialog('close');
                             $("#banner").datagrid('reload');

                         }
                     });
                 }
             },{
                 iconCls:'icon-cancel',
                 text:"取消",
                 handler:function () {
                     $("#saveDialogBanner").dialog('close');
                 }
             }]
         });
     }
     //批量删除多行
     function delBatchRowsBanner() {
         var rows=$("#banner").datagrid('getSelections');//返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
         if (rows.length<=0) {
             $.messager.show({title:'提示',msg:"至少选中一行"});
         }else {
             var ids=[];
             for (var i=0;i<rows.length;i++){
                 ids.push(rows[i].id);
             }
             $.ajax({
                 url:"${pageContext.request.contextPath}/banner/deleteRowsBanner",
                 type:"POST",
                 traditional:true,//传递数据类型的数据时必须设置这个属性为true,传统方式序列化数据
                 data:{id:ids},//传递参数
                 success:function () {
                     //消息提示
                     $.messager.show({title:'提示',msg:"删除成功!!"});
                     //刷新datagrid
                     $("#banner").datagrid('reload');
                 },
                 error:function () {
                     //消息提示
                     $.messager.show({title:'提示',msg:"删除失败!!"});
                     //刷新datagrid
                     $("#banner").datagrid('reload');
                 },
             })
         }
     }
</script>
        <table id="banner"></table>
        <%--datagrid工具栏--%>
        <div id="tb">
                <a href="#" class="easyui-linkbutton" onclick="openSaveDialogBanner();" data-options="iconCls:'icon-add',plain:true">添加</a>
                <a href="#" class="easyui-linkbutton" onclick="delBatchRowsBanner();" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
        </div>
        <%--更新用户的对话框--%>
        <div id="editDialogBanner" data-options="draggable:true,iconCls:'icon-edit',width:580,height:400,title:'更新用户信息'"></div>
        <%--保存用户的对话框--%>
        <div id="saveDialogBanner" data-options="draggable:true,iconCls:'icon-save',width:580,height:400,title:'添加用户信息'"></div>