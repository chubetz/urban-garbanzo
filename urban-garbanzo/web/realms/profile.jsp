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

<table border="0" cellpadding="3" cellspacing="1">
    <tr>
        <td bgcolor="${realm.treeSign.tableBgcolor}" width="100" rowspan="2">
           
        </td>
        <td  colspan="2" align="center" class="profile_realm_1" bgcolor="${realm.treeSign.tdBgcolor}" width="300">
            <span class="profile_realm_label">Предметная область</span>
            <br>
            <b>${realm.description}</b>
        </td>
    </tr>
    <tr >
        <td  class="profile_realm_2" width="200" bgcolor="${realm.treeSign.tdBgcolor}">
            <span class="profile_realm_label border">ID</span>
            
            <b>${realm.id}</b>
        </td>
        <td class="profile_realm_2" width="200" bgcolor="${realm.treeSign.tdBgcolor}">
            <span class="profile_realm_label border">Код</span>
            
            <b>${realm.text}</b>
        </td>
    </tr>
    <tr>
        <td bgcolor="${realm.treeSign.tdBgcolor}" colspan="3">

            <table border="0" width="100%">
                <tr>
                    <td valign="top" class="calibri_link" style="font-size: 17px;" align="center" width="50%">
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
                    <td valign="top"  class="calibri_link" align="center" width="50%">
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
