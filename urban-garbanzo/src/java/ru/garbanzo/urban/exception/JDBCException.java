/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.exception;

/**
 *
 * @author mithia
 */
public class JDBCException extends Exception {
    
    private Exception orig;
    private String request;
    private String addInfo;
    
    public JDBCException(Exception orig, String request, String addInfo) {
        super();
        this.orig = orig;
        this.request = request;
        this.addInfo = addInfo;
    }
    
    
}
