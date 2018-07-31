/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Realm extends Entity implements ITreeElement {
    
    
    Realm(int id) {
        super("Realm", id);
    }
    
    

    private static Map<String, Object> defaultState, defaultPrimaryKey;

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
        defaultState.put("text", "");
        defaultState.put("description", "");
    }
    
    public String getText() { //вспомогательный геттер
        return this.getStr("text");
    }
    
    public String getDescription() { //вспомогательный геттер
        return this.getStr("description");
    }

    private static Realm mock = new Realm(-100);
    public static Realm getMock() { //обертка для использования в jsp
        return mock;
    }

    public static Map<Integer, Realm> getMap() {
        return Collections.unmodifiableMap(getStorage().getRealmMap());
    }

    public String toString() {
        return "Область {" + getId() + "}";
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
        Map<String, Object> pk = JDBCUtils.saveEntity(realm);
        if (pk != null) { // удалось записать объект в БД
            realm.setPrimaryKey(pk);
            getStorage().register(realm);
            Utils.print("Realm pk: ", pk);
        } else {
            return null;
        }
            
        return realm;
    }
    

    public Map<Integer, Theme> getThemeMap() {
        return Collections.unmodifiableMap(getStorage().getThemeMap(this));
    }

    public String getThemesHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<ul>\r\n");
        for (Theme theme: getThemeMap().values()) {
            sb.append("\t<li>" + theme.getDbl("number") + " " + theme.getStr("text") + "\r\n");
        }
        sb.append("</ul>");
        return sb.toString();
    }
    
    public String getThemesForSelectHTML() {
        List<Theme> themes = new ArrayList<Theme>(getThemeMap().values());
        StringBuilder sb = new StringBuilder();
        sb.append("<select name=\"themes\" size=\"" + themes.size() + "\" multiple>\r\n");
        for (Theme theme: themes) {
            sb.append("\t<option value=\"" + theme.getId() + "\">" + theme.roundToIntStr(theme.getDbl("number")) + " " + theme.getStr("text") + "</option>\n");
        }
        sb.append("</select>");
        return sb.toString();
    }

    @Override
    public List<ITreeElement> getTreeElements() {
        return new ArrayList<ITreeElement>(getThemeMap().values());
    }
    

    @Override
    public TreeSign getTreeSign() {
        treeSign.setName("Предметная область " + this.getDescription());
        treeSign.setId(getTableName() + "_" + getId());
        treeSign.setTableBgcolor("#2DC7E9");
        treeSign.setTdBgcolor("#C0EFF9");
        treeSign.setEditLink("controller?action=edit_realm&id=" + getId());
        
        return treeSign;
        
    }

}
