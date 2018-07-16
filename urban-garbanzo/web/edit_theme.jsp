<%-- 
    Document   : edit_theme
    Created on : Jun 29, 2018, 11:18:33 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Редактировать тему</title>
    </head>
    <body>
<%@ include file="header.jsp" %>
        <p>${theme.getId() < 0  ? "<Новая тема>" : theme}</p>
        <form name="${action}" action="controller" method="POST">
            <input type="hidden" name="action" value="${action}">        
            <input type="hidden" name="tid" value="${theme.getId()}">        
            <label>Номер</label>
            <input type="text" name="number" value="${theme.getDbl("number")}">
            <br>
            <label>Название</label>
            <input type="text" name="text" value="${theme.getStr("text")}">
            <br>
            <label>Область</label>
            <select name="realmId">
                ${theme.getRealmsHTML()}
            </select>
            <br>
            <input type="submit" value="Отправить" /> 
        </form>
    </body>
</html>
