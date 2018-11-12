<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
     $(function () {
         $("#user").datagrid({

             url:"${pageContext.request.contextPath}/user/findAllUser",
             fit:true,
             fitColumns:true,//自动展示大小，适应网页宽度
             pagination:true,//显示分页工具栏
             pageSize:6,
             pageList:[6,12,18,24,30],
             ctrlSelect:true,
             editCell:{index:6,
                          field:'status'},
             columns:[[
                 {title:"用户名",field:"username",width:120,align:'center'},
                 {title:"密码",field:"password",width:120,align:'center'},
                 {title:"手机号",field:"phoneNum",width:120,align:'center'},
                 {title:"法名",field:"nickName",width:120,align:'center'},
                 {title:"省份",field:"province",width:120,align:'center'},
                 {title:"城市",field:"city",width:120,align:'center'},
                 {title:"状态",field:"status",width:120,align:'center'},
                 {title:"出生日期",field:"birthday",width:120,align:'center'},
                 {title:"options",field:"options",width:150,
                     formatter:function (value,row,index) {
                         return "<a href='javascript:;' class='options' onclick=\"deRowUser('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" ;

                     }
                 }
             ]],
             view: detailview,
             detailFormatter: function(rowIndex, rowData){
                 return '<table><tr>' +
                     '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic +'" style="height:50px;"></td>' +
                     '<td style="border:0">' +
                     '<p>性别: ' + rowData.sex + '</p>' +
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
        function deRowUser(id) {
            $.post("${pageContext.request.contextPath}/user/deleteUser",
                        {"id":id},
                        function (result) {
                $("#user").datagrid('reload');
            });
        }

</script>
        <table id="user"></table>

