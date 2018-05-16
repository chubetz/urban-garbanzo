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
        Тип: ${pageContext.request.getParameter("type")}
    </body>
</html>
