/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.Util;
import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Question implements DBEntity {
    
    public static final int INFO_TYPE = 0;
    public static final int TEST_TYPE = 1;
    public static final int COMMON_TYPE = 2;
    
    private int id;
    private final String tableName = "Question";
    private Map<String, Object> state = new LinkedHashMap<String, Object>();


    private String realm = "";
    private int type = -1;
    private String text = "";
    public String getRealm() {
        return realm;
    }

    public int getType() {
        return type;
    }

    public String getText() {
        return text;
    }

    @Override
    synchronized public Map<String, Object> getState() {
        state.put("realm", realm);
        state.put("type", type);
        state.put("text", text);
        return state;
    }
    @Override
    synchronized public void setState(Map<String, ?> map) {
        this.realm = (String)map.get("realm");
        int type = -1;
        if (map.get("type") instanceof String) {
            type = Integer.parseInt( (String)map.get("type") );
        } else if (map.get("type") instanceof Integer) {
            type = (Integer)map.get("type");
        }
        this.type = type;
        this.text = (String)map.get("text");
    }
    
    private static Map<Integer, Question> questionMap = new HashMap<Integer, Question>();
    public static Map<Integer, Question> getQuestionMap() {
        return questionMap;
    }
    static {
        List<Map<String, Object>> data = JDBCUtils.loadEntitiesData(new Question(-1));
        for (Map<String, Object> entry : data) {
            Question question = new Question((Integer)entry.get("id"));
            question.setState(entry);
            questionMap.put(question.id, question);
        }
    }

    /**
     * Get the value of id
     *
     * @return the value of id
     */
    public int getId() {
        return id;
    }

    private Question(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Вопрос {" + id + '}';
    }
    
    private static Map<String, Object> translateWebData(Map<String, String[]> data) {
        Map<String, Object> tmp = new HashMap<>();
        for (String key: data.keySet()) {
            String[] current = data.get(key);
            if (current.length == 1) {
                tmp.put(key, current[0]);
            } else {
                tmp.put(key, current);
            }
        }
        return tmp;
    }
    
    public static Question saveQuestionFromWeb(int id, Map<String, String[]> data) {
        return saveQuestion(id, translateWebData(data));
    }
    
    public static Question saveQuestion(int id, Map<String, ?> data) {
        Question question = questionMap.get(id);
        if (question == null) {
            question = new Question(id);
        }
        if (data != null) {
            if (data.get("realm").getClass().isArray()) { //список параметров с фронта
                data = translateWebData( (Map<String, String[]>)data );
            }
            Utils.print(data);
            question.setState(data);

        }
        int validId = JDBCUtils.saveEntity(question);
        if (validId >= 0) { // удалось записать объект в БД с валидным id
            question.id = validId;
            questionMap.put(question.id, question);
            Utils.print("validId: " + validId);
        } else {
            return null;
        }
            
        return question;
    }
    
    public static Question createQuestion(Map<String, ?> data) {
        return saveQuestion(-1, data);
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }


    
}
