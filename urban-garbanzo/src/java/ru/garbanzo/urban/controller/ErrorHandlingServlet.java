package ru.garbanzo.urban.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.garbanzo.urban.exception.ExceptionViewer;


/**
 *
 * @author mithia
 */
public class ErrorHandlingServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            super.service(req, resp); //To change body of generated methods, choose Tools | Templates.
        } catch (Exception e) {
            //e.printStackTrace(resp.getWriter());
            req.setAttribute("viewer", new ExceptionViewer(e));
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }


    
}
