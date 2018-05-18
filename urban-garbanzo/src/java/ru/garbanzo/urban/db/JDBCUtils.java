/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.controller.MainServlet;

/**
 *
 * @author d.gorshenin
 */
public class JDBCUtils {
    
    static {
        try {
            Class.forName("org.hsqldb.jdbc.JDBCDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static Connection getHSQLConnection(String user, String password) {
        System.out.println("Connecting to database...");
        try {            
            return DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/test1",user,password);
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtils.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    public static Connection getHSQLConnection() {
        return getHSQLConnection("SA", "");
    }
}
