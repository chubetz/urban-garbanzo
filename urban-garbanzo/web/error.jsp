<%-- 
    Document   : error
    Created on : Jul 28, 2018, 2:08:50 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ошибка 500</title>
    </head>
    <body>
        <h1>Внутренняя ошибка сервера (ошибка 500)</h1>
        <h3>${viewer.message}</h3>
        ${viewer.stackTrace}
    </body>
</html>
