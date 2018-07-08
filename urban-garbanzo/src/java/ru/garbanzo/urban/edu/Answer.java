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
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Answer extends Entity {
    
    Answer(int id) { // TODO! обязательно перенести весь класс Answer внутрь класса Question ::: а надо ли? все в одном пакете
        super("Answer", id);
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
        defaultState.put("questionId", -1);
        defaultState.put("text", "");
        defaultState.put("correct", false);
    }

    public static Map<Integer, Answer> getMap() {
        return Collections.unmodifiableMap(getStorage().getAnswerMap());
    }

    public static Answer saveAnswer(int id, Map<String, Object> data) throws NoQuestionException, JDBCException {
        int questionId = (Integer)data.get("questionId");
        Question question = Question.getMap().get(questionId);
        if (question == null) {
            throw new NoQuestionException("В системе нет вопроса с id = " + questionId);
        }
        
        Answer answer = getMap().get(id);
        if (answer == null)
            answer = new Answer(-1);
        Utils.print("saveAnswer", data);
        answer.setState(data);

        Map<String, Object> pk = JDBCUtils.saveEntity(answer);
        if (pk != null) { // удалось записать объект в БД
            answer.setPrimaryKey(pk);
            getStorage().register(answer);
            Utils.print("Answer pk: ", pk);
        } else {
            return null;
        }
            
        return answer;
    }

    
}
