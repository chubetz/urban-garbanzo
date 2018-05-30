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
    
    private int id;
    private final String tableName = "Question";
    private Map<String, Object> state = new LinkedHashMap<String, Object>();


    private String realm = "";

    @Override
    synchronized public Map<String, Object> getState() {
        state.put("realm", realm);
        return state;
    }
    
    private static Map<Integer, Question> questionMap = new HashMap<Integer, Question>();
    public static Map<Integer, Question> getQuestionMap() {
        return questionMap;
    }
    static {
        List<Map<String, Object>> data = JDBCUtils.loadEntitiesData(new Question(-1));
        for (Map<String, Object> entry : data) {
            Question question = new Question((Integer)entry.get("id"));
            question.realm = (String)entry.get("realm");
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
