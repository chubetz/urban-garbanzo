<%-- 
    Document   : statistics
    Created on : Sep 4, 2018, 6:15:44 AM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ru.garbanzo.urban.users.*" %>
<%
    IStatistics statistics = User.getDefaultUser().getStatistics();
    pageContext.setAttribute("stats", statistics);
%>
<table cellpadding="10">
    <tr>
        <td>
<table bgcolor ="white" border="1" >
    <tr>
        <td>Статистика</td>
    </tr>
    <tr>
        <td>
            Предметных областей: ${stats.realmsQty}
        </td>
    </tr>
    <tr>
        <td>
            Тем: ${stats.themesQty}
        </td>
    </tr>
    <tr>
        <td>
            Вопросов:
        </td>
    </tr>
    <tr>
        <td align="right">
            Nota bene: ${stats.questionsNotaBeneQty}
        </td>
    </tr>
    <tr>
        <td align="right">
            Общих: ${stats.questionsCommonQty}
        </td>
    </tr>
    <tr>
        <td align="right">
            Тестовых: ${stats.questionsTestQty}
        </td>
    </tr>
    <tr>
        <td>
            <c:if test="${stats.examsQty != 0}">
                Знания проверены ${stats.examsQty} раз со средней оценкой ${stats.averageScore}
            </c:if>
        </td>
    </tr>

</table>
            
        </td>
    </tr>
</table>

