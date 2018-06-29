/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author mithia
 */
public abstract class Entity implements DBEntity {

    abstract protected Map<String, Object> getDefaultState();

    //state
    protected Map<String, Object> state;
    
    protected int id = -1;
    protected final String tableName;
    
    protected Entity(int id, String tableName) {
        this.id = id;
        this.tableName = tableName;
        state = new LinkedHashMap<String, Object>(getDefaultState());
    }

    public int getId() {
        return this.id; 
    }
    public String getTableName() {
        return this.tableName;
    }

    public int getInt(String field) {
        return (Integer)this.state.get(field);
    }
    public double getDbl(String field) {
        return (Double)this.state.get(field);
    }
    public String getStr(String field) {
        return (String)this.state.get(field);
    }
    public boolean getBool(String field) {
        return (Boolean)this.state.get(field);
    }

    public String roundToIntStr(double dbl) {
        return (dbl == (int)dbl) ? (""+(int)dbl) : (""+dbl);
    }

    synchronized public Map<String, Object> getState() {
        return state;
    }
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
            } else if (current instanceof Double) {
                if (Utils.canBeCastedAgainst(value, Double.class))
                    state.put(key, (Double)value);
                else if (value instanceof String)
                     state.put(key, Double.parseDouble((String)value));
            } else if (current instanceof String) {
                state.put(key, (String)value);
            } else if (current instanceof Boolean) {
                state.put(key, (Boolean)value);
            }
            
        }
        
    }

    protected static Storage storage;
    protected static void acquireStorage() {
        storage = Storage.getStorage();
    }
    
    private Map<Integer, String> getAvailableRealms() {
        Map<Integer, String> map = new HashMap<Integer, String>();
        for (Realm realm: Realm.getMap().values()) {
            map.put(realm.getId(), realm.getStr("description"));
        }
        return map;
    }

    public String getRealmsHTML() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Integer, String> entry: getAvailableRealms().entrySet()) {
            sb.append("<option value=\"" + entry.getKey() + "\"");
            if (this.getInt("realmId") == entry.getKey())
                sb.append(" selected");
            sb.append(">" + entry.getValue() + "</option>\n");
        }
        return sb.toString();
    }
}
