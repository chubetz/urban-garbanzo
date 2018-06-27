/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ru.garbanzo.urban.edu;

import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Answer extends Entity {
    
    Answer(int id) { // TODO! обязательно перенести весь класс Answer внутрь класса Question ::: а надо ли? все в одном пакете
        super(id, "Answer");
    }
    
    private static Map<String, Object> defaultState;

    @Override
    protected Map<String, Object> getDefaultState() {
        return defaultState;
    }

    static {
        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("questionId", -1);
        defaultState.put("text", "");
        defaultState.put("correct", false);
    }

    public static Answer saveAnswer(int id, Map<String, Object> data) throws NoQuestionException, JDBCException {
        int questionId = (Integer)data.get("questionId");
        Question question = Question.getMap().get(questionId);
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
            answer = new Answer(-1);
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
