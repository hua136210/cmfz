<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>

    $(function(){
            $.ajax({
            url:'${pageContext.request.contextPath}/chapter/findOneChapter',
            type:'post',
            data:"id="+${param.id},
            success:function (data) {
                console.log(data);
                for (var i=0;i<data.length;i++) {
                    var results=data[i].children;
                    for (var j=0;j<results.length;j++){
                       var option= $("<option></option>").attr("value",results[j].title).text(results[j].title);
                        $("#chapter").append(option);
                    }
                }
            }
        });


    });

</script>
<div style="text-align: center;">
    <form id="downAudio" method="post" class="easyui-form" enctype="multipart/form-data">

        <div style="margin-top: 60px">章节:
            <select id="chapter" name="title">
                <option value="">----请选择下载章节-----</option>
            </select>
        </div>
    </form>

</div>
