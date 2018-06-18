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
                    break;
                }
                url = "/new_question.jsp";
                request.setAttribute("question", question);
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
//                try {
//                    question = Question.saveQuestion(request.getParameterMap());
//                } catch (JDBCException ex) {
//                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    url = "/db_error.jsp";
//                    break;
//                }
//                url = "/new_question.jsp";
//                request.setAttribute("question", question);
                break;
                
        }
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
        return "Short description";
    }// </editor-fold>

}
