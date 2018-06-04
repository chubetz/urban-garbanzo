/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author d.gorshenin
 */
public class Answer implements DBEntity{
    
    private int id = -1;
    
    private final String tableName = "Answer";
    private Map<String, Object> state = new LinkedHashMap<String, Object>();
    
    private int questionId = -1;
    private String text = "";
    private boolean correct;

    public int getQuestionId() {
        return questionId;
    }

    public String getText() {
        return text;
    }

    public boolean isCorrect() {
        return correct;
    }

    @Override
    synchronized public Map<String, Object> getState() {
        state.put("questionId", questionId);
        state.put("text", text);
        state.put("correct", correct);
        return state;
    }
    @Override
    synchronized public void setState(Map<String, ?> map) {
        this.text = (String)map.get("text");
        int questionId = -1;
        if (map.get("questionId") instanceof String) {
            questionId = Integer.parseInt( (String)map.get("questionId") );
        } else if (map.get("questionId") instanceof Integer) {
            questionId = (Integer)map.get("questionId");
        }
        this.questionId = questionId;
        this.correct = (Boolean)map.get("correct");
    }

    @Override
    public int getId() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }


    
}
