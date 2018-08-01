<%-- 
    Document   : new_realm
    Created on : Jun 29, 2018, 12:03:56 PM
    Author     : d.gorshenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Область сохранена</title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    <form name="back_to_edit" action="controller" method="POST">
                        <input type="hidden" name="action" value="edit_realm">        
                        <input type="hidden" name="id" value="${realm.getId()}">        
                        <input type="submit" value="Вернуться к редактированию" /> 
                    </form>                    
                </td>
                <td>
                    <form name="back_to_list" action="view" method="GET">
                        <input type="hidden" name="info" value="realms">        
                        <input type="submit" value="Переход к списку областей" /> 
                    </form>                    
                </td>
            </tr>
        </table>
        <h2>Область сохранена</h2>
        ${realm}<br>
        <br>
        Код: <b>${realm.getStr("text")}</b>  Описание: <b>${realm.getStr("description")}</b>
    </body>
</html>
