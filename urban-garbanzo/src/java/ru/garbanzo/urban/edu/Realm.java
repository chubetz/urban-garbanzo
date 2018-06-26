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
    
    private Realm() {}
    
    Realm(int id) {
        this.id = id;
    }
    
    private static Map<String, Object> defaultState;
    
    static {
        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("text", "");
        defaultState.put("description", "");
    }
    
    public static Map<Integer, Realm> getMap() {
        acquireStorage();
        return Collections.unmodifiableMap(storage.getRealmMap());
    }

    private int id = -1;
    private final String tableName = "Realm";

    //state
    private Map<String, Object> state = new LinkedHashMap<String, Object>(defaultState);

    @Override
    public int getId() {
        return this.id; 
    }
    @Override
    public String getTableName() {
        return this.tableName;
    }
    
    public int getInt(String field) {
        return (Integer)this.state.get(field);
    }
    public String getStr(String field) {
        return (String)this.state.get(field);
    }
    public boolean getBool(String field) {
        return (Boolean)this.state.get(field);
    }


    @Override
    synchronized public Map<String, Object> getState() {
        return state;
    }
    @Override
    synchronized public void setState(Map<String, ?> map) {
        for (Map.Entry<String, ?> entry: map.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            if (!state.containsKey(key))
                continue;
            
            Object current = state.get(key);
            if (current instanceof Integer) { //необходимо привести целевое значение к численному, т.к. может прийти и строка
                if (value instanceof Integer)
                    state.put(key, (Integer)value);
                else if (value instanceof String)
                     state.put(key, Integer.parseInt((String)value));
            } else if (current instanceof String) {
                state.put(key, (String)value);
            } else if (current instanceof Boolean) {
                state.put(key, (Boolean)value);
            }
            
        }
        
    }
    
}
