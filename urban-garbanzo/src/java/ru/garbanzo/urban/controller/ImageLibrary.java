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
import ru.garbanzo.urban.edu.Image;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class ImageLibrary extends ErrorHandlingServlet {

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
        String url = "/image_library.jsp";
        String action = request.getParameter("action");
        if (action == null)
            action = "";
        Question question = Question.getById(request.getParameter("questionId"));
        if (question == null) //несохраненный вопрос
            question = Question.getByTempId(request.getParameter("tempId"));
        request.setAttribute("question", question);
        if (action.equals("select")) { //пришел выбор изображений для карточки, сделанный пользователем
            question.clearImages(); //стираем все вопросы, так как должны прийти заново с формы
                
            Map<String, Object> paramMap = Utils.translateWebData(request.getParameterMap());
            Utils.print(paramMap);
            for (Map.Entry<String, Object> entry: paramMap.entrySet()) {
                String[] splitted = entry.getKey().split("_");
                if (splitted.length == 2 && splitted[0].equals("i")) { //чекбокс изображения
                    boolean selected = "on".equals(entry.getValue());
                    Utils.print(selected);
                    Image image = Image.getById(splitted[1]);
                    question.doImageLink(image, selected);
                }
                
            }
            request.setAttribute("select_done", true); //флаг, закрывающий окно библиотеки и перерисовывающий форму редактирования
        }
        request.setAttribute("imgLibTable", HTMLFactory.doImageLibraryTable(question, getServletContext()));
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
