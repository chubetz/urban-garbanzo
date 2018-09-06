<%-- 
    Document   : data_management.jsp
    Created on : Sep 6, 2018, 1:40:59 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table cellpadding="10">
    <tr>
        <td>
<table bgcolor ="white" border="1" >
    <tr>
        <td colspan="2">Управление данными</td>
    </tr>
    <tr>
        <td>
            <form name="add_question" action="controller" method="GET">
                <input type="hidden" name="action" value="new_question">        
                <input type="submit" value="Новый вопрос" /> 
            </form>
        </td>
        <td>
            <form name="export" action="controller" method="GET">
                <input type="hidden" name="action" value="export">        
                <input type="submit" value="Выгрузить в SQL" /> 
            </form>
        </td>
    </tr>
</table>
            
        </td>
    </tr>
</table>
