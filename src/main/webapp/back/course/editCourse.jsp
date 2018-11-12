<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    $(function(){
        $("#editCourseForm").form('load','${pageContext.request.contextPath}/course/findOne?id=${param.id}');
    })
</script>
<div style="text-align:center;margin-top:20px;">
<form id="editCourseForm" method="post">
    <div style="margin-top:-20px;">
        <input type="hidden" class="easyui-textbox" name="id" value="${param.id}"/><br/>
    </div>
    <div style="margin-top:10px;">
        课程名称:<input type="text" class="easyui-textbox" name="title"/><br/>
    </div>
    <div style="margin-left:-125px;margin-top:20px;">
        是否必修<input name="status" type="checkbox" value="1"/><br/>
    </div>
</form>
</div>