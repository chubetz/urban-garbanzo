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
import static ru.garbanzo.urban.edu.Realm.getMap;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author mithia
 */
public class Theme extends Entity {

    Theme(int id) {
        super("Theme", id);
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
        defaultState.put("realmId", -1);
        defaultState.put("text", "");
        defaultState.put("number", 0.0);
    }
    
    public String getText() { //вспомогательный геттер
        return this.getStr("text");
    }

    public String getNumberStr() { //вспомогательный геттер
        return this.getDblStr("number");
    }


    private static Theme mock = new Theme(-100);
    public static Theme getMock() { //обертка для использования в jsp
        return mock;
    }
    
    public static Map<Integer, Theme> getMap() {
        return Collections.unmodifiableMap(getStorage().getThemeMap());
    }
    
    public Realm getRealm() {
        return Realm.getMap().get(this.getInt("realmId"));
    }

    public String toString() {
        return "Тема {" + getId() + "} {" + getRealm().getStr("text") + "}";
    }

    public static Theme getById(Object id){
        if (id instanceof String)
            return getMap().get(Integer.parseInt((String)id));
        else
            return getMap().get((Integer)id);
    }

    public static Theme getById(int id){
        return Theme.getById(new Integer(id));
    }
    
    public static Theme saveTheme(String id, Map<String, ?> data) throws JDBCException {
        return saveTheme(Integer.parseInt(id), data);
    }
    public static Theme saveTheme(int id, Map<String, ?> data) throws JDBCException {
        Theme theme = getMap().get(id);
        Utils.print("saveTheme", data);
        if (theme == null) 
            theme = new Theme(-1);
        if (data != null && !data.isEmpty()) {
            if (data.get(data.keySet().toArray()[0]).getClass().isArray()) { //параметры пришли с фронта
                data = Utils.translateWebData( (Map<String, String[]>)data );
            }
            Utils.print("saveThemeAfterTranslation", data);
            Realm oldRealm = theme.getRealm();
            theme.setState(data);
            Realm realm = theme.getRealm();
            if (realm != null && oldRealm != null && realm.getId() != oldRealm.getId()) {
                for (int questionId: theme.getQuestionMap().keySet()) {
                    new ThemeQuestion(theme.getId(), questionId).delete();
                }
                getStorage().unbind(theme, oldRealm);
            }

        }
        Map<String, Object> pk = JDBCUtils.saveEntity(theme);
        if (pk != null) { // удалось записать объект в БД
            theme.setPrimaryKey(pk);
            getStorage().register(theme);
            Utils.print("Theme pk: ", pk);
        } else {
            return null;
        }
            
        return theme;
    }
    
    public Map<Integer, Question> getQuestionMap() {
        return Collections.unmodifiableMap(getStorage().getQuestionMap(this));
    }
    
    public String getQuestionsHTMLLink(String linkText) {
        return "<a href=view?info=questions&themeId=" + this.getId() + ">" + linkText + "</a>";
    }
    public String getQuestionsHTMLLink() {
        return getQuestionsHTMLLink("Вопросы");
    }

    @Override
    public boolean equals(Object obj) {
        return (obj instanceof Theme) && 
                ((Theme)obj).getPrimaryKey().equals(this.getPrimaryKey()) && 
                ((Theme)obj).getQuestionMap().keySet().equals(this.getQuestionMap().keySet());
    }
    
    public boolean isExaminable() {
        return !getQuestionMap().isEmpty();
    }
    
    
}
