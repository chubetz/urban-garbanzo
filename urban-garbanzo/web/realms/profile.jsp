<%-- 
    Document   : realmProfile
    Created on : Sep 29, 2018, 12:11:24 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url= "/includes/newheader.jsp" />
<c:import url= "/includes/newfooter.jsp" />

<form name="new" action="view" method="GET">
    <input type="hidden" name="info" value="realms">
    <input class="calibri_new" type="submit" value="Вернуться к списку областей" />
</form>
<table border="0" cellpadding="1" cellspacing="0" bgcolor="black" width="400"><tr><td>

<table border="0" cellpadding="3" cellspacing="1" width="100%">

    <form name="new" action="viewProfile" method="${mode == 'edit' ? 'POST' : 'GET'}">
        <input type="hidden" name="realm" value="${realm.id}">
    
    <tr>
        <td bgcolor="${realm.treeSign.tableBgcolor}" rowspan="2" width="15%">
           
        </td>
        <td  colspan="3" align="center" class="profile_realm_1" bgcolor="${realm.treeSign.tdBgcolor}">
            <span class="profile_realm_label border" style="background: ${realm.treeSign.tableBgcolor};"><b>Предметная область</b></span>
            <p style="font-size: 5px;"> </p>
            <c:choose>
                <c:when test="${mode == 'edit'}">
                    <input size="30" class="profile_realm_1 center bold" type="text" name="description" value="${realm.description}" required="true">
                </c:when>
                <c:otherwise>
                    <b>${realm.description}</b>
                </c:otherwise>
            </c:choose>
            
        </td>
    </tr>
    <tr >
        <td  class="profile_realm_2" bgcolor="${realm.treeSign.tdBgcolor}">
            <span class="profile_realm_label border" style="background: ${realm.treeSign.tableBgcolor};"><b>ID</b></span>
            
            <span >${realm.id}</span>
        </td>
        <td class="profile_realm_2" bgcolor="${realm.treeSign.tdBgcolor}">
            <span class="profile_realm_label border" style="background: ${realm.treeSign.tableBgcolor};"><b>Код</b></span>
            <c:choose>
                <c:when test="${mode == 'edit'}">
                    <input size="10" class="profile_realm_2 center " type="text" name="text" value="${realm.text}" required="true">
                </c:when>
                <c:otherwise>
                    <span >${realm.text}</span>
                </c:otherwise>
            </c:choose>
        </td>
        <td align="center" bgcolor="${realm.treeSign.tdBgcolor}">
            <c:choose>
                <c:when test="${mode == 'edit'}">
                    <input type="hidden" name="action" value="save">
                    <input class="calibri_new" style="background:black; color:white;" type="submit" value="Сохранить" />
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="edit">
                    <input class="calibri_new" style="background:${realm.treeSign.tableBgcolor}; color:black;" type="submit" value="Редактировать" />
                </c:otherwise>
            </c:choose>
       </td>
    </tr>

    </form>

    <tr>
        <td bgcolor="${realm.treeSign.tdBgcolor}" colspan="4">

            <table border="0" width="100%">
                <tr>
                    <td valign="top" class="calibri_link" style="font-size: 17px;" align="center">
                        <br>
                        <img src="images/questions_logo.png" width="50" border="1">
                        <br>
                        <a class="create_link" style="font-size: 10px" href="controller?action=new_question&realm=${realm.id}"><b>Создать</b></a>
                        <br>
                        Карточек:                 
                <c:choose>
                    <c:when test="${realm.questionsQty > 0}">
                        <b>${realm.getQuestionsHTMLLink('' + realm.questionsQty)}</b>
                    </c:when>
                    <c:otherwise>
                        ${realm.questionsQty}
                    </c:otherwise>
                </c:choose>

                    </td>
                    <td valign="top"  class="calibri_link" align="center">
                        <br>
                        <img src="images/themes_logo.png" width="50" border="1">
                        <br>
                        <div style="font-size: 17px;">Темы:</div>
                        <div align="left"><b>${realm.themesHTML}</b></div>
                    </td>
                    
                </tr>
                
            </table>
        </td>
    </tr>
</table>

            
</td></tr></table>
