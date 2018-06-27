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
            List<Map<String, Object>> data = JDBCUtils.loadEntitiesData(new Question(-1));
            for (Map<String, Object> entry : data) {
                Question question = new Question((Integer)entry.get("id"));
                question.setState(entry);
                storage.questionMap.put(question.getId(), question);
                storage.answerMapForQuestion.put(question.getId(), new HashMap<Integer, Answer>());
            }
            storage.answerMap = new HashMap<Integer, Answer>();
            data = JDBCUtils.loadEntitiesData(new Answer(-1)); //ответы
            for (Map<String, Object> entry : data) {
                Answer answer = new Answer((Integer)entry.get("id"));
                answer.setState(entry);
                storage.answerMap.put(answer.getId(), answer);
                Map<Integer, Answer> answerMap = storage.answerMapForQuestion.get(answer.getInt("questionId"));
                if (answerMap != null)
                    answerMap.put(answer.getId(), answer);
            }
        } catch (JDBCException ex) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, ex);
            storage.jdbcException = ex;
        }
        
        storage.realmMap = new HashMap<Integer, Realm>();
        
        Realm realm = new Realm(0);
        Map<String, Object> state = new LinkedHashMap<String, Object>();
        state.put("text", "java");
        state.put("description", "Java");
        realm.setState(state);
        storage.realmMap.put(realm.getId(), realm);
        
        realm = new Realm(1);
        state = new LinkedHashMap<String, Object>();
        state.put("text", "kotlin");
        state.put("description", "Kotlin");
        realm.setState(state);
        storage.realmMap.put(realm.getId(), realm);

        realm = new Realm(2);
        state = new LinkedHashMap<String, Object>();
        state.put("text", "sql");
        state.put("description", "SQL");
        realm.setState(state);
        storage.realmMap.put(realm.getId(), realm);

        realm = new Realm(3);
        state = new LinkedHashMap<String, Object>();
        state.put("text", "minecraft");
        state.put("description", "MINECRAFT");
        realm.setState(state);
        storage.realmMap.put(realm.getId(), realm);

        realm = new Realm(4);
        state = new LinkedHashMap<String, Object>();
        state.put("text", "oca_1");
        state.put("description", "OCA I");
        realm.setState(state);
        storage.realmMap.put(realm.getId(), realm);

       
    }
    
    static {
        init();
    }
    
}
