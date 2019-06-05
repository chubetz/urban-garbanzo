<%-- 
    Document   : image_library
    Created on : Jun 4, 2019, 1:07:44 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Библиотека изображений</title>
        <script type="text/javascript">
            function selectImgs() {
                //var event = document.createEvent("Event");
                //event.initEvent("test", true, true);
                //alert(window.opener.document.getElementById("addq").value);
                //window.opener.document.dispatchEvent(event);
                window.opener.document.getElementById("addq").click();
                window.close();
            }            
            if (${select_done}) { //сделан выбор изображений
                window.opener.document.getElementById("refresh").click();
                window.close();
            }
        </script>
    </head>
    <body>
        <form name="upload" action="controller" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="upload_image">        
            <input type="hidden" name="questionId" value="${question.id}">        
            <input type="hidden" name="tempId" value="${question.tempId}">        
            <input type="file" name="file" accept="image/jpeg,image/png,image/gif">
            <input type="submit" value="Загрузить новое изображение" /> 
        </form>
            
        
        <%--form name="selectImg" action="noResp" method="POST">
            <input type="Submit" onclick="selectImgs();"/>
        </form--%>
        <form name="selectImg" action="imgLib" method="POST" >
            <input type="hidden" name="questionId" value="${question.id}">
            <input type="hidden" name="tempId" value="${question.tempId}">        
            <input type="hidden" name="action" value="select">
            <table>
                <tr>
                    <td width="50%">
                        <p><b>${question}</b> - отметьте нужные изображения</p>
                    </td>
                    <td width="50%" align="right">
                        <input type="Submit" value="Сделать выбор">
                    </td>
                </tr>
            </table>
            ${imgLibTable}
        </form>
    </body>
</html>
