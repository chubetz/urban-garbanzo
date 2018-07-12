<%-- 
    Document   : edit_question
    Created on : Jun 16, 2018, 6:36:24 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Редактировать вопрос</title>
        <script type="text/javascript" src="tinymce/tinymce.js"></script>
        <!-- TinyMCE -->
        <script type="text/javascript">
        tinyMCE.init({
            //mode : "exact",
            //elements : "rrr"
            selector: 'textarea',
            forced_root_block : false,
            menubar: false
         });
        </script>
        <!-- /TinyMCE -->
    </head>
    <body bgcolor = #DAD644>
<%@ include file="header.jsp" %>
        <p>${question.getId() < 0  ? "<Новый вопрос>" : question}</p>
        <form name="${action}" action="controller" method="POST">
            <input id="actiontag" type="hidden" name="action" value="${action}">        
            <input type="hidden" name="id" value="${question.getId()}">        
            <label>Область</label>
            <select name="realmId">
                ${question.getRealmsHTML()}
            </select>
            <br>
            <label>Тип вопроса</label>
            <select name="type">
                ${question.getTypesHTML()}
            </select>
            <br>
            <table width="800" cellpadding="10">
                <tr>
                    <td>
                        <p>Текст вопроса</p>
                        <textarea name="text" rows="10" cols="80">${question.getStr("text")}</textarea>
                    </td>
                    <td style="vertical-align: top">
                        <p>Правильные ответы</p>
                        <select name="correct" size="${question.getAnswersSizeForHTML()}" multiple>
                            ${question.getAnswersCorrectHTML()}
                        </select>
                        
                    </td>
                </tr>
            </table>
            <br>
            ${question.getAnswersEditHTML()}
            <input type="submit" onclick="document.getElementById('actiontag').value = 'add_answer';" value="Добавить ответ"/> 
            <input type="submit" value="Отправить" /> 
        </form>
    </body>
</html>
