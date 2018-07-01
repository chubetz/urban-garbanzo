/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Map;

/**
 *
 * @author d.gorshenin
 */
public interface DBEntity {
    
    String getTableName();

    Map<String, Object> getState();
    void setState(Map<String, ?> map);
    
    Map<String, Object> getPrimaryKey();
    void setPrimaryKey(Map<String, ?> map);
}
