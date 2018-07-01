/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author mithia
 */
public abstract class Entity implements DBEntity {

    abstract protected Map<String, Object> getDefaultState();
    abstract protected Map<String, Object> getDefaultPrimaryKey();

    //state
    protected Map<String, Object> state, primaryKey;

    protected final String tableName;
    
    protected Entity(String tableName, Object... primaryKey) {
        this.primaryKey = new LinkedHashMap<String, Object>(getDefaultPrimaryKey());
        String[] pk_fields = this.primaryKey.keySet().toArray(new String[0]);
        for (int i = 0; i < pk_fields.length; i++) {
            if (this.primaryKey.get(pk_fields[i]).getClass() != primaryKey[i].getClass())
                throw new RuntimeException("Неверное поле в составе первичного ключа! Ожидается " + pk_fields[i].getClass() + ", получено " + primaryKey[i].getClass() + " (" + primaryKey[i] + ")");
            this.primaryKey.put(pk_fields[i], primaryKey[i]);
        }
        this.tableName = tableName;
        state = new LinkedHashMap<String, Object>(getDefaultState());
    }

    public String getTableName() {
        return this.tableName;
    }

    public int getId() { //у большинства сущностей id - первичный ключ, так что удобен отдельный геттер
        return getPKInt("id");
    }

    public int getInt(String field) {
        return (Integer)this.state.get(field);
    }
    public int getPKInt(String field) {
        return (Integer)this.primaryKey.get(field);
    }
    public double getDbl(String field) {
        return (Double)this.state.get(field);
    }
    public double getPKDbl(String field) {
        return (Double)this.primaryKey.get(field);
    }
    public String getStr(String field) {
        return (String)this.state.get(field);
    }
    public String getPKStr(String field) {
        return (String)this.primaryKey.get(field);
    }
    public boolean getBool(String field) {
        return (Boolean)this.state.get(field);
    }
    public boolean getPKBool(String field) {
        return (Boolean)this.primaryKey.get(field);
    }

    public String roundToIntStr(double dbl) {
        return (dbl == (int)dbl) ? (""+(int)dbl) : (""+dbl);
    }

    synchronized public Map<String, Object> getState() {
        return state;
    }
    synchronized public Map<String, Object> getPrimaryKey() {
        return primaryKey;
    }
    synchronized public void setState(Map<String, ?> map) {
        setPKOrState(state, map);
    }
    synchronized public void setPrimaryKey(Map<String, ?> map) {
        setPKOrState(primaryKey, map);
    }

    synchronized private void setPKOrState(Map<String, Object> pkOrState, Map<String, ?> map) {
        for (Map.Entry<String, ?> entry: map.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            if (!pkOrState.containsKey(key))
                continue;
            
            Object current = pkOrState.get(key);
            if (current instanceof Integer) { //необходимо привести целевое значение к численному, т.к. может прийти и строка
                if (value instanceof Integer)
                    pkOrState.put(key, (Integer)value);
                else if (value instanceof String)
                     pkOrState.put(key, Integer.parseInt((String)value));
            } else if (current instanceof Double) {
                if (Utils.canBeCastedAgainst(value, Double.class))
                    pkOrState.put(key, (Double)value);
                else if (value instanceof String)
                     pkOrState.put(key, Double.parseDouble((String)value));
            } else if (current instanceof String) {
                pkOrState.put(key, (String)value);
            } else if (current instanceof Boolean) {
                pkOrState.put(key, (Boolean)value);
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
            map.put(realm.getPKInt("id"), realm.getStr("description"));
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
