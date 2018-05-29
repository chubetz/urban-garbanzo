/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import ru.garbanzo.urban.db.JDBCUtils;

/**
 *
 * @author d.gorshenin
 */
public class Question implements DBEntity {
    
    private int id;
    private final String tableName = "Question";
    private Map<String, Object> state = new LinkedHashMap<String, Object>();


    private String realm;

    @Override
    synchronized public Map<String, Object> getState() {
        state.put("realm", realm);
        return state;
    }
    
    private static Map<Integer, Question> questionMap = new HashMap<Integer, Question>();

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
    
    public static Question saveQuestion(int id, Map<String, ?> data) {
        Question question = questionMap.get(id);
        if (question == null) {
            question = new Question(id);
        }
        if (data != null) {
            if (data.get("realm").getClass().isArray()) {
                question.realm = ((String[])data.get("realm"))[0];
            } else {
                question.realm = (String)data.get("realm");
            }
                
        }
        int validId = JDBCUtils.saveEntity(question);
        if (validId >= 0) { // удалось записать объект в БД с валидным id
            question.id = validId;
            questionMap.put(id, question);
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
