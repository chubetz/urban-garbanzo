/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import ru.garbanzo.urban.edu.Answer;
import ru.garbanzo.urban.edu.Image;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.edu.Realm;
import ru.garbanzo.urban.edu.Storage;
import ru.garbanzo.urban.edu.Theme;
import ru.garbanzo.urban.exception.JDBCException;

/**
 * утилиты отображения списков сущностей
 * @author d.gorshenin
 */
class ViewUtils {
    
    static void fillAttributesQuestions(HttpServletRequest request) throws JDBCException {
        final Integer realmId, themeId;
        String realmIdPar = request.getParameter("realmId");
        String themeIdPar = request.getParameter("themeId");
        realmId = (realmIdPar != null && !realmIdPar.isEmpty()) ? Integer.parseInt(realmIdPar) : null;
        themeId = (themeIdPar != null && !themeIdPar.isEmpty()) ? Integer.parseInt(themeIdPar) : null;
        Theme theme = themeId != null ? Theme.getById(themeId) : null;
        if (theme != null)
            request.setAttribute("addInfo", "<b style='color:" + theme.getTreeSign().getTableBgcolor() + "'>Тема: " + theme.getProfileLink(theme.getTitle()) + "</b>");

        StringBuilder sb = new StringBuilder();
        
        sb.append("<table>");
        if (Storage.getJdbcException() != null) {
            throw Storage.getJdbcException();
        }
        List<Question> questions = Question.getMap().values().stream()
                .filter(q -> realmId == null || q.getRealm().getId() == realmId)
                .filter(q -> themeId == null || q.getThemeQuestion(Theme.getById(themeId)) != null)
                .sorted(themeId != null ? Theme.getById(themeId).getQuestionComparator() : Comparator.naturalOrder())
                .collect(Collectors.toList());
        for (Question question: questions) {
            String bgcolor = " bgcolor=red";
            if (question.isValid()) {
                bgcolor = ""; //вопрос валидный, подсветки не надо
            }
            sb.append("<tr>");
            sb.append("<td" + bgcolor + "><form name=\"edit\" action=\"controller\" method=\"POST\">");
            sb.append("<input type=\"hidden\" name=\"action\" value=\"load_edit_form\">");
            sb.append("<input type=\"hidden\" name=\"id\" value=\"" + question.getId() + "\">");
            if (themeId != null) {
                sb.append("<input type=\"hidden\" name=\"themeId\" value=\"" + themeId + "\">");
            }
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
                    ansText = "<div class=\"border\">" + ansText + "</div>";
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
        request.setAttribute("total", questions.size());
        
    }

//    static void fillAttributesRealms(HttpServletRequest request) throws JDBCException {
//
//        StringBuilder sb = new StringBuilder();
//        
//        sb.append("<div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_realm'>Создать</a></div>\n");
//        sb.append("<table>\n");
//        if (Storage.getJdbcException() != null) {
//            throw Storage.getJdbcException();
//        }
//        int counter = 0;
//        for (Map.Entry<Integer, Realm> entry: Realm.getMap().entrySet()) {
//            Realm realm = entry.getValue();
//            counter++;
//            sb.append("<tr>");
//            sb.append("<td><form name=\"edit\" action=\"controller\" method=\"POST\">");
//            sb.append("<input type=\"hidden\" name=\"action\" value=\"edit_realm\">");
//            sb.append("<input type=\"hidden\" name=\"id\" value=\"" + realm.getId() + "\">");
//            sb.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
//            sb.append("<td>");
//            sb.append(realm.toString());
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append(realm.getStr("text"));
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append(realm.getStr("description"));
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append("                    <form name=\"questions\" action=\"view\" method=\"GET\">\n" +
//"                        <input type=\"hidden\" name=\"info\" value=\"questions\">        \n" +
//"                        <input type=\"hidden\" name=\"realmId\" value=\"" + realm.getId() + "\">        \n" +
//"                        <input type=\"submit\" value=\"Список вопросов\" /> \n" +
//"                    </form>                    \n" +
//"");
//            sb.append("</td>");
//            sb.append("</tr>");
//            sb.append("<tr>");
//            sb.append("<td colspan=5>");
//            sb.append(realm.getThemesHTML());
//            sb.append("</td>");
//            sb.append("</tr>");
//        }
//        sb.append("</table>");
//    
//        request.setAttribute("list_table", sb.toString());
//        request.setAttribute("total", counter);
//    }

//    static void fillAttributesThemes(HttpServletRequest request) throws JDBCException {
//        StringBuilder sb = new StringBuilder();
//        sb.append("<div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_theme'>Создать</a></div>");
//        sb.append("<table>");
//        if (Storage.getJdbcException() != null) {
//            throw Storage.getJdbcException();
//        }
//        int counter = 0;
//        for (Map.Entry<Integer, Theme> entry: Theme.getMap().entrySet()) {
//            Theme theme = entry.getValue();
//            counter++;
//            sb.append("<tr>");
//            sb.append("<td><form name=\"edit\" action=\"controller\" method=\"POST\">");
//            sb.append("<input type=\"hidden\" name=\"action\" value=\"edit_theme\">");
//            sb.append("<input type=\"hidden\" name=\"id\" value=\"" + theme.getId() + "\">");
//            sb.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
//            sb.append("<td>");
//            sb.append(theme.toString());
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append(theme.getDblStr("number"));
//            //sb.append(theme.getValue().getDbl("number"));
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append(theme.getStr("text"));
//            if (theme.getQuestionMap().size() > 0) {
//                //sb.append(" (" + theme.getQuestionMap().size() + " вопр.)");
//                sb.append(" (" + theme.getQuestionsHTMLLink("" + theme.getQuestionMap().size() + " вопр.") + ")");
//            }
//            sb.append("</td>");
//            sb.append("<td>");
//            sb.append(theme.getProfileLink());
//            sb.append("</td>");
//            sb.append("</tr>");
////            sb.append("<tr>");
////            sb.append("<td colspan=2>");
////            sb.append("</td>");
////            sb.append("<td colspan=2>");
////            sb.append("</td>");
////            sb.append("</tr>");
//        }
//        sb.append("</table>");
//    
//        request.setAttribute("list_table", sb.toString());
//        request.setAttribute("total", counter);
//        
//        
//    }

    static void fillAttributesImages(HttpServletRequest request, ServletContext context) throws JDBCException {
        StringBuilder sb = new StringBuilder();
        sb.append("<div style='font-family:Tahoma; color:black; font-weight:bold'><a style='color:black;' href='controller?action=new_image'>Загрузить</a></div>");
        sb.append("<table>");
        if (Storage.getJdbcException() != null) {
            throw Storage.getJdbcException();
        }
        int counter = 0;
        String uploads = context.getInitParameter("upload.location");
        if (uploads.startsWith("/"))
            uploads = new String(Arrays.copyOfRange(uploads.toCharArray(), 1, uploads.toCharArray().length));
        for (Map.Entry<Integer, Image> entry: Image.getMap().entrySet()) {
            Image image = entry.getValue();
            counter++;
            sb.append("<tr>");
            sb.append("<td>");
            sb.append(image.getStr("filename") + "." + image.getStr("extension"));
            sb.append("</td>");
            sb.append("<td>");
            sb.append("<img src=\"" + uploads + "/" + image.getId() + "\" width=\"20%\" height=\"20%\">");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</table>");
    
        request.setAttribute("list_table", sb.toString());
        request.setAttribute("total", counter);
        
        
    }
    
}
