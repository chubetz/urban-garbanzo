/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.exception.JDBCException;

/**
 *
 * @author d.gorshenin
 */
public class Realm extends Entity {
    
    
    Realm(int id) {
        super(id, "Realm");
        state = new LinkedHashMap<String, Object>(defaultState);
    }
    
    static {
        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("text", "");
        defaultState.put("description", "");
    }
    
    public static Map<Integer, Realm> getMap() {
        acquireStorage();
        return Collections.unmodifiableMap(storage.getRealmMap());
    }


    
}
