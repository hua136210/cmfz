<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    $(function(){
        $("#courseDg").datagrid({
            url:'${pageContext.request.contextPath}/course/findAllCourse',
            fit:true,
            onLoadSuccess:btn,
            fitColumns:true,
            pagination:true,
            toolbar:'#coursetb',
            singleSelect:'true',
            columns:[[
                {field:'id',title:'id',width:80},
                {field:'title',title:'课程名称',width:80,},
                {field:'creatTime',title:'创建时间',sortable:true,width:100,},
                {field:'status',title:'状态',width:80,formatter: function (value, row,index) {
                        if(row.status=='1') {
                            return "<span style='color:red;'>必修</span>";
                        }
                    },
                },
                {
                    field: 'options', title: 'options', width: 100, formatter: function (value, row,index) {
                        if(row.status=='1') {
                            return "<a class='del' onclick=deleteOneCourse('" + row.id + "')>删除</a>&nbsp;&nbsp;<a class='upd' onclick=\"updateRowCourse('" + row.id + "')\">修改</a>";
                        }
                    },
                },
            ]],
        })
    });

    /*操作按钮*/
    function btn(){
        $(".del").linkbutton({
            iconCls:'icon-remove',
            plain:true,
        });
        $(".upd").linkbutton({
            iconCls:'icon-edit',
            plain:true,
        });
    }



    /*删除一行数据*/
    function deleteOneCourse(id){
        $.post('${pageContext.request.contextPath}/course/delete',{id:id},function(result){
            if(result.success){
                $.messager.show({title:'提示',iconCls:'icon-bell',msg:"课程删除成功!!!"});
            }else{
                $.messager.show({title:'提示',iconCls:'icon-bell',msg:result.message});
            }
            $("#courseDg").datagrid('reload');
        });
    }

    /*更新一行数据*/
    function updateRowCourse(id){
        $("#editCourse").dialog({
            title:'修改课程',
            iconCls:'icon-flag_cn',
            width:400,
            height:200,
            href:'${pageContext.request.contextPath}/back/course/editCourse.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#editCourseForm").form('submit',{
                        url:'${pageContext.request.contextPath}/course/update',
                        success:function(result){
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({
                                    title:'我的消息',
                                    msg:'修改成功!!',
                                    iconCls:'icon-bell',
                                    showType:'slide'
                                });
                            }else{
                                $.messager.show({
                                    title:'我的消息',
                                    msg:resultObj.message,
                                    iconCls:'icon-bell_error',
                                    showType:'slide'
                                });
                            }
                            $("#editCourse").dialog('close');
                            $("#courseDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#editCourse").dialog('close');
                    $("#courseDg").datagrid('reload');
                }
            }]
        });
    }

</script>

<table id="courseDg" title="功课详情"></table>

<div id="editCourse"></div>





