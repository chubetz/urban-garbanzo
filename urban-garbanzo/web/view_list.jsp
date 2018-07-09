<%-- 
    Document   : question_list
    Created on : Jul 9, 2018, 2:50:46 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body bgcolor = #d8cFaA>
<%@ include file="header.jsp" %>
        <h2>${title}</h2>
        <h3>(всего ${total})</h3>
        
        ${list_table}
    </body>
</html>
