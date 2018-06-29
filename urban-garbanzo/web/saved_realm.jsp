<%-- 
    Document   : new_realm
    Created on : Jun 29, 2018, 12:03:56 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Область сохранена</title>
    </head>
    <body>
        <h2>Область сохранена</h2>
        ${realm}<br>
        <br>
        Код: <b>${realm.getStr("text")}</b>  Описание: <b>${realm.getStr("description")}</b>
    </body>
</html>
