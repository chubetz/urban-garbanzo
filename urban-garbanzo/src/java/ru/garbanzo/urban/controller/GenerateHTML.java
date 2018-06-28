/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.garbanzo.urban.edu.Answer;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.edu.Realm;
import ru.garbanzo.urban.edu.Storage;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author mithia
 */
@WebServlet(name = "GenerateHTML", urlPatterns = {"/GenerateHTML"})
public class GenerateHTML extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String title = null;
        StringBuilder body = new StringBuilder(); // HTML-код, который будет включаться в body
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        String action = request.getParameter("info");
        switch (action) {
            case "questions":
                title = "Список загруженных вопросов";
                body.append("<table>");
                try {
                    if (Storage.getJdbcException() != null) {
                        throw Storage.getJdbcException();
                    }
                    for (Map.Entry<Integer, Question> question: Question.getMap().entrySet()) {
                        String bgcolor = " bgcolor=red";
                        if (question.getValue().isValid()) {
                            bgcolor = ""; //вопрос валидный, подсчетки не надо
                        }
                        body.append("<tr>");
                        body.append("<td" + bgcolor + "><form name=\"edit\" action=\"controller\" method=\"POST\">");
                        body.append("<input type=\"hidden\" name=\"action\" value=\"load_edit_form\">");
                        body.append("<input type=\"hidden\" name=\"qid\" value=\"" + question.getKey() + "\">");
                        body.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
                        body.append("<td>");
                        body.append(question.getValue().toString());
                        body.append("</td>");
                        body.append("<td>");
                        body.append(question.getValue().getStr("text"));
                        body.append("</td>");
                        for (Map.Entry<Integer, Answer> answer: question.getValue().getAnswerMap().entrySet()) {
                            body.append("<td>");
                            String ansText = answer.getValue().getStr("text");
                            if (answer.getValue().getBool("correct")) {
                                ansText = "<b>" + ansText + "</b>";
                            }
                            body.append(ansText);
                            body.append("</td>");
                        }
                        body.append("</tr>");
                    }
                } catch (JDBCException e) {
                    request.setAttribute("exception", e);
                    getServletContext().getRequestDispatcher("/db_error.jsp").forward(request, response);                    
                }
                body.append("</table>");
                break;
            case "realms":
                title = "Список имеющихся областей";
                body.append("<table>");
                try {
                    if (Storage.getJdbcException() != null) {
                        throw Storage.getJdbcException();
                    }
                    for (Map.Entry<Integer, Realm> realm: Realm.getMap().entrySet()) {
                        body.append("<tr>");
                        body.append("<td><form name=\"edit\" action=\"controller\" method=\"POST\">");
                        body.append("<input type=\"hidden\" name=\"action\" value=\"edit_realm\">");
                        body.append("<input type=\"hidden\" name=\"rid\" value=\"" + realm.getKey() + "\">");
                        body.append("<input type=\"submit\" value=\"Edit\" /></form></td>");
                        body.append("<td>");
                        body.append(realm.getValue().toString());
                        body.append("</td>");
                        body.append("<td>");
                        body.append(realm.getValue().getStr("text"));
                        body.append("</td>");
                        body.append("<td>");
                        body.append(realm.getValue().getStr("description"));
                        body.append("</td>");
                        body.append("</tr>");
                    }
                } catch (JDBCException e) {
                    request.setAttribute("exception", e);
                    getServletContext().getRequestDispatcher("/db_error.jsp").forward(request, response);                    
                }
                body.append("</table>");
        }



            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
            out.println("<title>" + title + "</title>");            
            out.println("</head>");
            out.println("<body bgcolor = #d8cFaA>");
            

            out.println("<h2>" + title + "</h2>");
            out.println(body.toString());
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Generating HTML View";
    }// </editor-fold>

}
