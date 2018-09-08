<%-- 
    Document   : index
    Created on : Sep 8, 2018, 6:36:02 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Система </title> <!--фиксации знаний-->
        <link rel="stylesheet" href="css/newcss.css" type="text/css"/>
    </head>
    <body>
        <table border="0">
            <tr>
                <td>
                    <c:import url= "/widgets/statistics.jsp" />
                </td>
                <td valign="top">
                    <c:import url= "/widgets/data_management.jsp" />
                </td>
            </tr>
        </table>
            
    </body>
</html>
