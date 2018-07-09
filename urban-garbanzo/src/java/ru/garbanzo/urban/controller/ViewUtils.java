/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import ru.garbanzo.urban.edu.Answer;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.edu.Realm;
import ru.garbanzo.urban.edu.Storage;
import ru.garbanzo.urban.edu.Theme;
import ru.garbanzo.urban.exception.JDBCException;

/**
 *
 * @author d.gorshenin
 */
class ViewUtils {
    
    static void fillAttributesQuestions(HttpServletRequest request) throws JDBCException {
        String realmId = request.getParameter("realmId");

        StringBuilder sb = new StringBuilder();
        
        sb.append("<table>");
        if (Storage.getJdbcException() != null) {
            throw Storage.getJdbcException();
        }
        int counter = 0;
        for (Map.Entry<Integer, Question> entry: Question.getMap().entrySet()) {
            Question question = entry.getValue();
            if (realmId != null && question.getRealm().getId() != Integer.parseInt(realmId))
                continue;
            counter++;
            String bgcolor = " bgcolor=red";
            if (question.isValid()) {
                bgcolor = ""; //вопрос валидный, подсчетки не надо
            }
            sb.append("<tr>");
            sb.append("<td" + bgcolor + "><form name=\"edit\" action=\"controller\" method=\"POST\">");
            sb.append("<input type=\"hidden\" name=\"action\" value=\"load_edit_form\">");
            sb.append("<input type=\"hidden\" name=\"qid\" value=\"" + question.getId() + "\">");
            sb.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
            sb.append("<td>");
            sb.append(question);
            sb.append("</td>");
            sb.append("<td>");
            sb.append(question.getStr("text"));
            sb.append("</td>");
            for (Map.Entry<Integer, Answer> ans_entry: question.getAnswerMap().entrySet()) {
                Answer answer = ans_entry.getValue();
                sb.append("<td>");
                String ansText = answer.getStr("text");
                if (answer.getBool("correct")) {
                    ansText = "<b>" + ansText + "</b>";
                }
                sb.append(ansText);
                sb.append("</td>");
            }
            sb.append("</tr>");
            sb.append("<tr>");
            sb.append("<td colspan=2>");
            sb.append("</td>");
            sb.append("<td colspan=5>");
            sb.append("<div style=\"font-size: 14px;color:blue;\">");
            sb.append(question.getThemesHTML());
            sb.append("</div>");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</table>");
        
        request.setAttribute("list_table", sb.toString());
        request.setAttribute("total", counter);
        
    }

    static void fillAttributesRealms(HttpServletRequest request) throws JDBCException {

        StringBuilder sb = new StringBuilder();
        
        sb.append("<div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_realm'>Создать</a></div>\n");
        sb.append("<table>\n");
        if (Storage.getJdbcException() != null) {
            throw Storage.getJdbcException();
        }
        int counter = 0;
        for (Map.Entry<Integer, Realm> entry: Realm.getMap().entrySet()) {
            Realm realm = entry.getValue();
            counter++;
            sb.append("<tr>");
            sb.append("<td><form name=\"edit\" action=\"controller\" method=\"POST\">");
            sb.append("<input type=\"hidden\" name=\"action\" value=\"edit_realm\">");
            sb.append("<input type=\"hidden\" name=\"rid\" value=\"" + realm.getId() + "\">");
            sb.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
            sb.append("<td>");
            sb.append(realm.toString());
            sb.append("</td>");
            sb.append("<td>");
            sb.append(realm.getStr("text"));
            sb.append("</td>");
            sb.append("<td>");
            sb.append(realm.getStr("description"));
            sb.append("</td>");
            sb.append("<td>");
            sb.append("                    <form name=\"questions\" action=\"view\" method=\"GET\">\n" +
"                        <input type=\"hidden\" name=\"info\" value=\"questions\">        \n" +
"                        <input type=\"hidden\" name=\"realmId\" value=\"" + realm.getId() + "\">        \n" +
"                        <input type=\"submit\" value=\"Список вопросов\" /> \n" +
"                    </form>                    \n" +
"");
            sb.append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
            sb.append("<td colspan=5>");
            sb.append(realm.getThemesHTML());
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</table>");
    
        request.setAttribute("list_table", sb.toString());
        request.setAttribute("total", counter);
    }

    static void fillAttributesThemes(HttpServletRequest request) throws JDBCException {
        StringBuilder sb = new StringBuilder();
        sb.append("<div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_theme'>Создать</a></div>");
        sb.append("<table>");
        if (Storage.getJdbcException() != null) {
            throw Storage.getJdbcException();
        }
        int counter = 0;
        for (Map.Entry<Integer, Theme> entry: Theme.getMap().entrySet()) {
            Theme theme = entry.getValue();
            counter++;
            sb.append("<tr>");
            sb.append("<td><form name=\"edit\" action=\"controller\" method=\"POST\">");
            sb.append("<input type=\"hidden\" name=\"action\" value=\"edit_theme\">");
            sb.append("<input type=\"hidden\" name=\"tid\" value=\"" + theme.getId() + "\">");
            sb.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
            sb.append("<td>");
            sb.append(theme.toString());
            sb.append("</td>");
            sb.append("<td>");
            sb.append(theme.getDblStr("number"));
            //sb.append(theme.getValue().getDbl("number"));
            sb.append("</td>");
            sb.append("<td>");
            sb.append(theme.getStr("text"));
            sb.append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
            sb.append("<td colspan=2>");
            sb.append("</td>");
            sb.append("<td colspan=2>");
            sb.append(theme.getQuestionsHTML());
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</table>");
    
        request.setAttribute("list_table", sb.toString());
        request.setAttribute("total", counter);
        
        
    }

    
}
