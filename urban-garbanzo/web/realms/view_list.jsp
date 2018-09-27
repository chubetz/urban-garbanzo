<%-- 
    Document   : view_list
    Created on : Sep 27, 2018, 6:44:01 AM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url= "/includes/newheader.jsp" />
<c:import url= "/includes/icons.jsp" />

<h3>(всего ${realms.size()} элементов)</h3>
<%--div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_realm'>Создать</a></div--%>

<table border="0" cellpadding="1" cellspacing="0" bgcolor="black"><tr><td>

<table class="tdbg1" border="0" cellpadding="5" cellspacing="1">
    <tr class="tdbg2 calibri_hdr" align="center">
        <td>
            <form name="new" action="controller" method="GET">
                <input type="hidden" name="action" value="new_realm">
                <input class="calibri_new" type="submit" value="Создать" />
            </form>
        </td>
        <td>
            Предметная область
        </td>
        <td>
            ID
        </td>
        <td>
            Код
        </td>
        <td>
            Темы
        </td>
        <td>
            Карточки
        </td>
    </tr>
<c:forEach var="r" items="${realms}">
    <tr class="calibri_cell">
        <td align="center">
            <form name="edit" action="controller" method="POST">
                <input type="hidden" name="action" value="edit_realm">
                <input type="hidden" name="id" value="${r.id}">
                <button type="submit" style="font-family: Calibri; font-weight: 700;">Редактировать</button>
            </form>
        </td>
        <td><b>${r.description}</b></td>
        <td>${r.id}</td>
        <td>${r.text}</td>
        <td class="calibri_link"><b>${r.themesHTML}</b></td>
        <td align="center" class="calibri_link" style="font-size: 17px;">
                <c:choose>
                    <c:when test="${r.questionsQty > 0}">
                        <b>${r.getQuestionsHTMLLink('' + r.questionsQty)}</b>
                    </c:when>
                    <c:otherwise>
                        ${r.questionsQty}
                    </c:otherwise>
                </c:choose>
        </td>
    </tr>
</c:forEach>
</table>
    
</td></tr></table>

<c:import url= "/includes/newfooter.jsp" />
