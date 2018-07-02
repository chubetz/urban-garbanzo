/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.db.JDBCUtils;
import static ru.garbanzo.urban.edu.Question.COMMON_TYPE;
import static ru.garbanzo.urban.edu.Question.INFO_TYPE;
import static ru.garbanzo.urban.edu.Question.TEST_TYPE;
import ru.garbanzo.urban.exception.JDBCException;

/**
 *
 * @author d.gorshenin
 */
public class Storage {
    
    private static Storage storage;
    private JDBCException jdbcException;
    public static JDBCException getJdbcException() {
        return storage.jdbcException;
    }
    
    private Map<Integer, Question> questionMap;    
    private Map<Integer, Answer> answerMap;    
    private Map<Integer, Map<Integer, Answer>> answerMapForQuestion;    
    private Map<Integer, Realm> realmMap;    
    private Map<Integer, Theme> themeMap;    
    

    Map<Integer, Question> getQuestionMap() {
        return questionMap;
    }

    Map<Integer, Answer> getAnswerMap() {
        return answerMap;
    }

    Map<Integer, Answer> getAnswerMap(int questionId) {
        if (questionId >= 0) {
            if (answerMapForQuestion.get(questionId) == null) {
                answerMapForQuestion.put(questionId, new HashMap<Integer, Answer>());
            }
            return answerMapForQuestion.get(questionId);
        } else {
            return new HashMap<Integer, Answer>();
        }
    }

    Map<Integer, Realm> getRealmMap() {
        return realmMap;
    }

    Map<Integer, Theme> getThemeMap() {
        return themeMap;
    }

    private Storage() {}
    
    static Storage getStorage() {
        return storage;
    }
    
    public static void init() {
        storage = new Storage();

        try {
            storage.jdbcException = null; //сносим исключение, хранившееся с момента предыдущего неудачного запуска
            
            storage.questionMap = new HashMap<Integer, Question>();
            storage.answerMapForQuestion = new HashMap<Integer, Map<Integer, Answer>>();
            List<Entity> data = JDBCUtils.loadEntitiesData(new Question(-1));
            for (Entity entity : data) {
                Question question = new Question(-1);
                question.setPrimaryKey(entity.getPrimaryKey());
                question.setState(entity.getState());
                storage.questionMap.put(question.getId(), question);
                storage.answerMapForQuestion.put(question.getId(), new HashMap<Integer, Answer>());
            }
            
            storage.answerMap = new HashMap<Integer, Answer>();
            data = JDBCUtils.loadEntitiesData(new Answer(-1)); //ответы
            for (Entity entity : data) {
                Answer answer = new Answer(-1);
                answer.setPrimaryKey(entity.getPrimaryKey());
                answer.setState(entity.getState());
                storage.answerMap.put(answer.getId(), answer);
                Map<Integer, Answer> answerMap = storage.answerMapForQuestion.get(answer.getInt("questionId"));
                if (answerMap != null)
                    answerMap.put(answer.getId(), answer);
            }
    
            storage.realmMap = new HashMap<Integer, Realm>();
            data = JDBCUtils.loadEntitiesData(new Realm(-1)); //области
            for (Entity entity : data) {
                Realm realm = new Realm(-1);
                realm.setPrimaryKey(entity.getPrimaryKey());
                realm.setState(entity.getState());
                storage.realmMap.put(realm.getId(), realm);
            }

            storage.themeMap = new HashMap<Integer, Theme>();
            data = JDBCUtils.loadEntitiesData(new Theme(-1)); //области
            for (Entity entity : data) {
                Theme theme = new Theme(-1);
                theme.setPrimaryKey(entity.getPrimaryKey());
                theme.setState(entity.getState());
                storage.themeMap.put(theme.getId(), theme);
            }

        } catch (JDBCException ex) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, ex);
            storage.jdbcException = ex;
        }
        
    }
    
    static {
        init();
    }
    
}
