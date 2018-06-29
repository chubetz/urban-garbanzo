<%-- 
    Document   : saved_theme
    Created on : Jun 29, 2018, 11:28:19 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Тема сохранена</title>
    </head>
    <body>
        <h2>Тема сохранена</h2>
        ${theme}<br>
        <br>
        Номер: <b>${theme.getDbl("number")}</b>  Название: <b>${theme.getStr("text")}</b>
    </body>
</html>
