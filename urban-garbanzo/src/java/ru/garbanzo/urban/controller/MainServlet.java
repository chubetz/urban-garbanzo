/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.edu.Answer;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class MainServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    @Override
    public void init()
            throws ServletException {
        
        
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding ("UTF-8");
        String action = request.getParameter("action");
        String url = null;
        Question question;
        switch (action) {
            case "add_question":
                Utils.print("Servlet.add_question", request.getParameterMap());
                try {
                    question = Question.createQuestion(request.getParameterMap());
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                url = "/new_question.jsp";
                request.setAttribute("question", question);
                break;
            case "new_question":
                url = "/edit_question.jsp";
                Utils.print("Servlet.new_question", request.getParameterMap());
                request.setAttribute("question", Question.getMockQuestion());
                request.setAttribute("action", "add_question");
                break;
            case "load_edit_form":
                url = "/edit_question.jsp";
                Utils.print("Servlet.edit_question", request.getParameterMap());
                Utils.print(request.getParameter("qid"));
                request.setAttribute("question", Question.getQuestionById(request.getParameter("qid")));
                request.setAttribute("action", "update_question");
                break;
            case "update_question":
                Utils.print("Servlet.update_question", request.getParameterMap());
                try {
                    question = Question.saveQuestion(request.getParameter("qid"), request.getParameterMap());
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                url = "/new_question.jsp";
                request.setAttribute("question", question);
                break;

            case "export":
                Question.init(); // реинициализация, чтобы выгрузка была строго из БД
                try {
                    StringBuilder sb = new StringBuilder();
                        sb.append("DROP TABLE Question IF EXISTS;\r\n");
                        sb.append("CREATE TABLE Question (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realm VARCHAR(20), type int, text VARCHAR(2000));\r\n");
                        sb.append("\tDROP TABLE Answer IF EXISTS;\r\n");
                        sb.append("\tCREATE TABLE Answer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean, text VARCHAR(2000));\r\n");
                    for (Question q: Question.getQuestionMap().values()) {
                        Map<String, Object> state = q.getState();
                        sb.append("INSERT INTO Question (id");
                        for (String s: state.keySet()) {
                            sb.append("," + s);
                        }
                        sb.append(") OVERRIDING SYSTEM VALUE VALUES (" + q.getId());
                        for (Object o: state.values()) {
                            String ooo;
                            if (o instanceof String) 
                                ooo = "'" + o + "'";
                            else
                                ooo=o.toString();
                            sb.append("," + ooo);
                        }
                        sb.append(");\r\n");
                        
                        for (Answer a: q.getAnswerMap().values()) {
                            Map<String, Object> stateA = a.getState();
                            sb.append("\tINSERT INTO Answer (id");
                            for (String s: stateA.keySet()) {
                                sb.append("," + s);
                            }
                            sb.append(") OVERRIDING SYSTEM VALUE VALUES (" + a.getId());
                            for (Object o: stateA.values()) {
                                String ooo;
                                if (o instanceof String) 
                                    ooo = "'" + o + "'";
                                else
                                    ooo=o.toString();
                                sb.append("," + ooo);
                            }
                            sb.append(");\r\n");
                            
                        }
                    }
                    Utils.print(sb);
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    response.setHeader("Content-Disposition", "attachment; filename=\"questions.sql\"");
                    PrintWriter out = response.getWriter();
                    out.print(sb.toString());
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                break;
                
        }
        if (url != null)
            getServletContext().getRequestDispatcher(url).forward(request, response);
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
        
        String action = request.getParameter("action");
        if (action.equals("new_question") || action.equals("export"))
            processRequest(request, response);
        else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("Недопустимые параметры");
        }
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
        return "Short description";
    }// </editor-fold>

}
