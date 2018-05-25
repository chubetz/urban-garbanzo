/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.controller.MainServlet;
import ru.garbanzo.urban.edu.DBEntity;
import ru.garbanzo.urban.util.Utils;

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
    
    public static int saveEntity(DBEntity entity) {
        Connection conn = null;
        PreparedStatement prp = null;
        String sql = null;
        try {
            conn = JDBCUtils.getHSQLConnection();
            sql = "SELECT * FROM " + entity.getTableName() + "WHERE id = " + entity.getId();
            prp = conn.prepareStatement(sql);
            //prp.setInt(1, (Integer)entity.getState().get("id"));
            ResultSet rs = prp.executeQuery();
            if (rs.first()) {
                // обновляем запись
            } else {
                //вставляем новую запись (id, скорее всего, будет -1)
                StringBuilder fields = new StringBuilder("("), values = new StringBuilder(" VALUES (");
                boolean first = true;
                for (Map.Entry<String, Object> entry: entity.getState().entrySet()) {
                    if (first) {
                        first = false;
                    } else {
                        fields.append(",");
                        values.append(",");
                    }
                    fields.append(entry.getKey());
                    if (entry.getValue() instanceof String) {
                        values.append("'" + entry.getValue() + "'");
                    } else {
                        values.append(entry.getValue().toString());
                    }
                }
                fields.append(")"); values.append(")");
                Utils.print(fields.toString() + values.toString());
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            try {
                if (prp != null) prp.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                return -1;
            }
        }
        return -1;
    }
    
    private void testCode() {
        /*
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement prp = null;
        try {
            conn = JDBCUtils.getHSQLConnection();            
            System.out.println(conn);
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM Customer";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                int id  = rs.getInt("id");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String street = rs.getString("street");
                String city = rs.getString("city");
                //System.out.println("" + id + " " + firstName + " " + lastName + " " + street + " " + city);
            }            
            rs.close();
            
            String psql = "INSERT INTO Customer VALUES(?,?,?,?,?)";
            prp = conn.prepareStatement(psql);
            
            prp.setInt(1, 333);
            prp.setString(2, "Maria");
            prp.setString(3, "Mastchenko");
            prp.setString(4, "Belomorskaya");
            prp.setString(5, "Snezhinks");
            int rows = prp.executeUpdate();
            
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                int id  = rs.getInt("id");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String street = rs.getString("street");
                String city = rs.getString("city");
                System.out.println("" + id + " " + firstName + " " + lastName + " " + street + " " + city);
            }            
            rs.close();
            
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (prp != null) prp.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        */
    }
    
}
