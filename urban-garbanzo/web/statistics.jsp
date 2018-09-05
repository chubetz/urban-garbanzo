<%-- 
    Document   : statistics
    Created on : Sep 4, 2018, 6:15:44 AM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="ru.garbanzo.urban.users.*" %>
<%
    IStatistics statistics = State.getUserState().getStatistics();
%>
<table>
    <tr>
        <td>Статистика</td>
    </tr>
    <tr>
        <td>
            Предметных областей: ${statistics.realmsQty}
        </td>
    </tr>
</table>
