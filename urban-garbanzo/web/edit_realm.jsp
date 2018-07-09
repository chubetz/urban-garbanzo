<%-- 
    Document   : edit_realm
    Created on : Jun 29, 2018, 10:57:49 AM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Редактировать область</title>
    </head>
    <body>
<%@ include file="header.jsp" %>
        <p>${realm.getId() < 0  ? "<Новая область>" : realm}</p>
        <form name="${action}" action="controller" method="POST">
            <input type="hidden" name="action" value="${action}">        
            <input type="hidden" name="rid" value="${realm.getId()}">        
            <label>Код</label>
            <input type="text" name="text" value="${realm.getStr("text")}">
            <br>
            <label>Описание</label>
            <input type="text" name="description" value="${realm.getStr("description")}">
            <br>
            <input type="submit" value="Отправить" /> 
        </form>
    </body>
</html>
