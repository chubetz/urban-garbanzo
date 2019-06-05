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
import static ru.garbanzo.urban.edu.Entity.getStorage;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author mithia
 */
public class Image extends Entity {

    Image(int id) {
        super("Image", id);
    }

    private static Map<String, Object> defaultState, defaultPrimaryKey;

    @Override
    public boolean isPkAuto() {
        return true;
    }

    @Override
    protected Map<String, Object> getDefaultState() {
        return defaultState;        
    }
    @Override
    protected Map<String, Object> getDefaultPrimaryKey() {
        return defaultPrimaryKey;
    }

    static {
        defaultPrimaryKey = new LinkedHashMap<String, Object>();
        defaultPrimaryKey.put("id", -1);

        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("filename", "");
        defaultState.put("extension", "");
    }
    
    public static Map<Integer, Image> getMap() {
        return Collections.unmodifiableMap(getStorage().getImageMap());
    }
    
    public static Image getById(Object id){
        if (id instanceof String)
            return getMap().get(Integer.parseInt((String)id));
        else
            return getMap().get((Integer)id);
    }
    
    public static Image saveImage(String id, Map<String, ?> data) throws JDBCException {
        return saveImage(Integer.parseInt(id), data);
    }
    
    public static Image saveImage(int id, Map<String, ?> data) throws JDBCException {
        Image image = getMap().get(id);
        Utils.print("saveImage", data);
        if (image == null) 
            image = new Image(-1);
        if (data != null && !data.isEmpty()) {
            if (data.get(data.keySet().toArray()[0]).getClass().isArray()) { //параметры пришли с фронта
                data = Utils.translateWebData( (Map<String, String[]>)data );
            }
            Utils.print("saveThemeAfterTranslation", data);
            image.setState(data);

        }
        Map<String, Object> pk = JDBCUtils.saveEntity(image);
        if (pk != null) { // удалось записать объект в БД
            image.setPrimaryKey(pk);
            getStorage().register(image);
            Utils.print("Image pk: ", pk);
        } else {
            return null;
        }
            
        return image;
    }
    
    public boolean delete() {
        return false;
    }
    
    public boolean containedInQuestion(Question q) {
        return q.containsImage(this);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Image)) return false;
        Image other = (Image) obj;
        return this.getId() == other.getId(); 
    }
    
    @Override
    public int hashCode() {
        return this.getId()*13;
    }
    
}
