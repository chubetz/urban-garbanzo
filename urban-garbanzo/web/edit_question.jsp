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
    </head>
    <body>
        <p>${question == null ? "<Новый вопрос>" : question}</p>
        <form name="${action}" action="controller" method="POST">
            <input type="hidden" name="action" value="${action}">        
            <label>Область</label>
            <select name="realm">
                ${question.getRealmsHTML()}
            </select>
            <br>
            <label>Тип вопроса</label>
            <select name="type">
                ${question.getTypesHTML()}
            </select>
            <br>
            <table cellpadding="10">
                <tr>
                    <td>
                        <p>Текст вопроса</p>
                        <textarea name="text" rows="10" cols="80">${question.getText()}</textarea>
                    </td>
                    <td style="vertical-align: top">
                        <p>Правильные ответы</p>
                        <select name="correct" size="4" multiple>
                            ${question.getAnswersCorrectHTML()}
                        </select>
                        
                    </td>
                </tr>
            </table>
            <br>
            ${question.getAnswersEditHTML()}
            <input type="submit" value="Отправить" /> 
        </form>
    </body>
</html>