<%-- 
    Document   : saved_theme
    Created on : Jun 29, 2018, 11:28:19 PM
    Author     : mithia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Тема сохранена</title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    <form name="back_to_edit" action="controller" method="POST">
                        <input type="hidden" name="action" value="edit_theme">        
                        <input type="hidden" name="tid" value="${theme.getId()}">        
                        <input type="submit" value="Вернуться к редактированию" /> 
                    </form>                    
                </td>
                <td>
                    <form name="back_to_list" action="view" method="GET">
                        <input type="hidden" name="info" value="themes">        
                        <input type="submit" value="Переход к списку тем" /> 
                    </form>                    
                </td>
            </tr>
        </table>
        <h2>Тема сохранена</h2>
        ${theme}<br>
        <br>
        Номер: <b>${theme.getDbl("number")}</b>  Название: <b>${theme.getStr("text")}</b>
    </body>
</html>
