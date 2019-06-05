/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.util.Arrays;
import java.util.Comparator;
import javax.servlet.ServletContext;
import ru.garbanzo.urban.edu.Image;
import ru.garbanzo.urban.edu.Question;

/**
 *
 * @author d.gorshenin
 */
public class HTMLFactory {
    
    public static String doImageLibraryTable(Question question, ServletContext context) {
        StringBuilder sb = new StringBuilder();
        String uploads = context.getInitParameter("upload.location");
        if (uploads.startsWith("/"))
            uploads = uploads.substring(1);
        String upl = uploads;
        sb.append("<table border=2>");
        Image.getMap().values().stream()
                .sorted(Comparator.<Image>comparingInt(i -> i.containedInQuestion(question) ? 0 : 1)
                        .thenComparingInt(i -> -i.getId()))
                .forEach(i -> {
                    sb.append("<tr>");
                    sb.append("<td>");
                    sb.append("id: " + i.getId());
                    sb.append("</td>");
                    sb.append("<td>");
                    sb.append("имя: " + i.getStr("filename") + "." + i.getStr("extension"));
                    sb.append("</td>");
                    sb.append("<td>");
                    sb.append("<input name='i_" + i.getId() + "' type='checkbox' " + (i.containedInQuestion(question) ? "checked" : "")  + ">");
                    sb.append("</td>");
                    sb.append("</tr>");
                    sb.append("<tr>");
                    sb.append("<td colspan=3>");
                    sb.append("<img src=\"" + upl + "/" + i.getId() + "\" width=\"20%\" height=\"20%\">");
                    sb.append("</td>");
                    sb.append("</tr>");
                });

        sb.append("</table>");
        return sb.toString();
    }
    
}
