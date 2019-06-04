<%-- 
    Document   : edit_question
    Created on : Jun 16, 2018, 6:36:24 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url= "/includes/newheader.jsp" />
<%--c:import url= "/includes/icons.jsp" /--%>
        <p>${question.getId() < 0  ? "<Новый вопрос>" : question}</p>
        <c:if test="${question.id >= 0}">
            <p>Создан: ${question.regDateStr}&nbsp;&nbsp;&nbsp;Изменен: ${question.updateDateStr}</p>
        </c:if>
        <form name="${action}" action="controller" method="POST">
            <input id="actiontag" type="hidden" name="action" value="${action}">        
            <input type="hidden" name="id" value="${question.id}">        
            <c:if test="${question.newThemeId >= 0}">
            <input type="hidden" name="newThemeId" value="${question.newThemeId}">
            </c:if>
            <label>Область</label>
            ${question.getRealmsHTML()}
            <br>
            <label>Тип вопроса</label>
            <select name="type">
                ${question.getTypesHTML()}
            </select>
            <br>
            <c:if test="${theme != null}">
                <span style="border: 1px solid black;padding: 1px;background-color:#C7AE99;">Порядковый номер вопроса в теме <b>${theme.text}<b>&nbsp;&nbsp;&nbsp;<input type="text" size="3" name="orderNum" value="${orderNum}"></span>
                <input type="hidden" name="themeId" value="${theme.id}">
            </c:if>
            <table width="80%" cellpadding="10">
                <tr>
                    <td width="60%">
                        <p>Текст вопроса</p>
                        <textarea name="text" rows="10" cols="80">${question.getStrLtGt("text")}</textarea>
                    </td>
                    <td width="10%" style="vertical-align: top">
                        <p>Правильные ответы</p>
                        <select name="correct" size="${question.getAnswersSizeForHTML()}" multiple>
                            ${question.getAnswersCorrectHTML()}
                        </select>
                        
                    </td>
                    <td width="30%" style="vertical-align: top">
                        <p>Изображения</p>
                        <input type="button" value="Открыть библиотеку изображений" onclick="window.open('imgLib?questionId=${question.id}', '${question}', 'menubar=no, scrollbars=yes, status=yes')">
                    </td>
                </tr>
            </table>
            <br>
            ${question.getAnswersEditHTML()}
            <input id="addq" type="submit" onclick="document.getElementById('actiontag').value = 'add_answer';" value="Добавить ответ"/> 
            <input type="submit" value="Отправить" /> 
        </form>
        <script type="text/javascript">
            function handler1() {
              alert('Спасибо!');
            };
            this.addEventListener("test", handler1); // Спасибо!
        </script>
<c:import url= "/includes/newfooter.jsp" />
