<%-- 
    Document   : examFinished
    Created on : Jul 20, 2018, 12:38:44 AM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body>
        <h3>${examResult}</h3>
        Открыть профиль темы: ${theme.getCardLink(theme.title)} 
    </body>
</html>
