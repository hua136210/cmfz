<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
     $(function () {
         $("#article").datagrid({

             url:"${pageContext.request.contextPath}/article/findAllArticle",
             fit:true,
             fitColumns:true,//自动展示大小，适应网页宽度
             pagination:true,//显示分页工具栏
             pageSize:6,
             pageList:[6,12,18,24,30],
             ctrlSelect:true,
             editCell:{index:6,
                          field:'status'},
             columns:[[
                 {title:"文章名",field:"title",width:120,align:'center'},
                 {title:"文章内容",field:"content",width:120,align:'center'},
                 {title:"出版日期",field:"publishDate",width:120,align:'center'},
                 {title:"options",field:"options",width:150,
                     formatter:function (value,row,index) {
                         return "<a href='javascript:;' class='options' onclick=\"deRowArticle('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" ;

                     }
                 }
             ]],
             view: detailview,
             detailFormatter: function(rowIndex, rowData){
                 return '<table><tr>' +
                     '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath +'" style="height:50px;"></td>' +
                     '<td style="border:0">' +
                     '<p>文章名: ' + rowData.title + '</p>' +
                     '<p>出版日期: ' + rowData.publishDate + '</p>' +
                     '</td>' +
                     '</tr></table>';
             },

             //在数据加载成功的时候触发
             onLoadSuccess:function () {
                 $(".options").linkbutton();
             },

         });
     });
     //删除一行的事件
        function deRowArticle(id) {
            $.post("${pageContext.request.contextPath}/article/deleteArticle",
                        {"id":id},
                        function (result) {
                $("#article").datagrid('reload');
            });
        }

</script>
        <table id="article"></table>

