/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ru.garbanzo.urban.edu;

import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Answer implements DBEntity{
    
    private Answer() {
        
    }
    
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
        return id; 
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }
    
    public String to_s(Object s) {
        return s.toString();
    }

    public static Answer saveAnswer(int id, Map<String, Object> data) throws NoQuestionException {
        int questionId = (Integer)data.get("questionId");
        Question question = Question.getQuestionMap().get(questionId);
        if (question == null) {
            throw new NoQuestionException("В системе нет вопроса с id = " + questionId);
        }
        Answer answer = null;
        for (int ansId: question.getAnswerMap().keySet()) {
            if (ansId == id) {
                answer = question.getAnswerMap().get(ansId);
                break;
            }
        }
        
        if (answer == null)
            answer = new Answer();
        Utils.print("saveAnswer", data);
        answer.setState(data);

        int validId = JDBCUtils.saveEntity(answer);
        if (validId >= 0) { // удалось записать объект в БД с валидным id
            answer.id = validId;
            Utils.print("Answer validId: " + validId);
        } else {
            return null;
        }
            
        return answer;
    }

    
}
