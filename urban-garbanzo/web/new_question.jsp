<%-- 
    Document   : new_question
    Created on : May 15, 2018, 12:18:01 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Новый вопрос</title>
    </head>
    <body>
        <h2>Вопрос добавлен</h2>
        ${question}<br>
        <table>
            <tr>
                <td colspan="${question.getAnswerMap().size()}">
                    ${question.text}
                </td>
            </tr>
        ${question.getAnswersHTML()}
        </table>
        <br>
        ${question.isValid() ? "Вопрос составлен корректно" : "<font color=red>Вопрос составлен некорректно</font>"}
    </body>
</html>
