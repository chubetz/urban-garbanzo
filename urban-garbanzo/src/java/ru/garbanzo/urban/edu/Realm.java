/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Realm extends Entity {
    
    
    Realm(int id) {
        super(id, "Realm");
    }
    
    

    private static Map<String, Object> defaultState;

    @Override
    protected Map<String, Object> getDefaultState() {
        return defaultState;
    }

    static {
        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("text", "");
        defaultState.put("description", "");
    }
    
    private static Realm mock = new Realm(-100);
    public static Realm getMock() { //обертка для использования в jsp
        return mock;
    }

    public static Map<Integer, Realm> getMap() {
        acquireStorage();
        return Collections.unmodifiableMap(storage.getRealmMap());
    }

    public String toString() {
        return "Область {" + id + "}";
    }

    public static Realm getById(Object id){
        if (id instanceof String)
            return getMap().get(Integer.parseInt((String)id));
        else
            return getMap().get((Integer)id);
    }

    public static Realm getById(int id){
        return Realm.getById(new Integer(id));
    }
    
    public static Realm saveRealm(String id, Map<String, ?> data) throws JDBCException {
        return saveRealm(Integer.parseInt(id), data);
    }
    public static Realm saveRealm(int id, Map<String, ?> data) throws JDBCException {
        Realm realm = getMap().get(id);
        Utils.print("saveRealm", data);
        if (realm == null) {
            realm = new Realm(-1);
        }
        if (data != null && !data.isEmpty()) {
            if (data.get(data.keySet().toArray()[0]).getClass().isArray()) { //параметры пришли с фронта
                data = Utils.translateWebData( (Map<String, String[]>)data );
            }
            Utils.print("saveRealmAfterTranslation", data);
            realm.setState(data);

        }
        int validId = JDBCUtils.saveEntity(realm);
        if (validId >= 0) { // удалось записать объект в БД с валидным id
            realm.id = validId;
            storage.getRealmMap().put(realm.id, realm);
            Utils.print("realm validId: " + validId);
        } else {
            return null;
        }
            
        return realm;
    }
}
