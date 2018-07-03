/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.db.JDBCUtils;
import static ru.garbanzo.urban.edu.Entity.getStorage;
import static ru.garbanzo.urban.edu.Question.COMMON_TYPE;
import static ru.garbanzo.urban.edu.Question.INFO_TYPE;
import static ru.garbanzo.urban.edu.Question.TEST_TYPE;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

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
    private Set<ThemeQuestion> themeQuestionSet;    
    private Map<Integer, Map<Integer, Question>> questionMapForTheme;    
    private Map<Integer, Map<Integer, Theme>> themeMapForQuestion;    
    private Map<Integer, Map<Integer, Theme>> themeMapForRealm; 
    
    private <T> void provideDefaultMap(Map<Integer, Map<Integer, T>> map, int key) {
        if (key >= 0) {
            if (map.get(key) == null) {
                map.put(key, new HashMap<Integer, T>());
            }
        }
    }
    

    Map<Integer, Question> getQuestionMap() {
        return questionMap;
    }

    Map<Integer, Answer> getAnswerMap() {
        return answerMap;
    }

    Map<Integer, Answer> getAnswerMap(Question question) {
        int questionId = question.getId();
        provideDefaultMap(answerMapForQuestion, questionId);
        if (questionId >= 0) {
            return answerMapForQuestion.get(questionId);
        } else {
            return new HashMap<Integer, Answer>();
        }
    }
    
    void addAnswer(Answer answer, Question question) {
        if (question == null) return;
        int questionId = question.getId();
        provideDefaultMap(answerMapForQuestion, questionId);
        answerMapForQuestion.get(questionId).put(answer.getId(), answer);
    }

    Map<Integer, Theme> getThemeMap(Realm realm) { //для вопросов
        int realmId = realm.getId();
        provideDefaultMap(themeMapForRealm, realmId);
        if (realmId >= 0) {
            return themeMapForRealm.get(realmId);
        } else {
            return new HashMap<Integer, Theme>();
        }
    }

    void addTheme(Theme theme, Realm realm) {
        if (realm == null) return;
        int realmId = realm.getId();
        provideDefaultMap(themeMapForRealm, realmId);
        themeMapForRealm.get(realmId).put(theme.getId(), theme);
    }
    
    void deleteTheme(Theme theme, Realm realm) {
        if (realm != null) {
            Map<Integer, Theme> map = themeMapForRealm.get(realm.getId());
            map.remove(theme.getId());
        }
    }

    Map<Integer, Theme> getThemeMap(Question question) { //для вопросов
        int questionId = question.getId();
        provideDefaultMap(themeMapForQuestion, questionId);
        if (questionId >= 0) {
            return themeMapForQuestion.get(questionId);
        } else {
            return new HashMap<Integer, Theme>();
        }
    }

    Map<Integer, Question> getQuestionMap(Theme theme) { //для вопросов
        int themeId = theme.getId();
        provideDefaultMap(questionMapForTheme, themeId);
        if (themeId >= 0) {
            return questionMapForTheme.get(themeId);
        } else {
            return new HashMap<Integer, Question>();
        }
    }
    
    void linkQuestionTheme(Question question, Theme theme) {
        Utils.print("linked question: ", question);
        Utils.print("linked theme: ", theme);
    }

    void unlinkQuestionTheme(Question question, Theme theme) {
        
    }

//    void addTheme(Theme theme, Question question) {
//        if (question == null) return;
//        int questionId = question.getId();
//        provideDefaultMap(themeMapForQuestion, questionId);
//        themeMapForQuestion.get(questionId).put(theme.getId(), theme);
//    }


//    void addQuestion(Question question, Theme theme) {
//        if (theme == null) return;
//        int themeId = theme.getId();
//        provideDefaultMap(questionMapForTheme, themeId);
//        questionMapForTheme.get(themeId).put(question.getId(), question);
//    }


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
            List<DBEntity> data = JDBCUtils.loadEntitiesData(new Question(-1));
            for (DBEntity entity : data) {
                Question question = new Question(-1);
                question.setPrimaryKey(entity.getPrimaryKey());
                question.setState(entity.getState());
                storage.questionMap.put(question.getId(), question);
            }
            
            storage.answerMap = new HashMap<Integer, Answer>();
            data = JDBCUtils.loadEntitiesData(new Answer(-1)); //ответы
            for (DBEntity entity : data) {
                Answer answer = new Answer(-1);
                answer.setPrimaryKey(entity.getPrimaryKey());
                answer.setState(entity.getState());
                storage.answerMap.put(answer.getId(), answer);
                Question question = storage.questionMap.get(answer.getInt("questionId")); //извлекаем вручную, т.к. данные только заполняются
                storage.addAnswer(answer, question);
            }
    
            storage.realmMap = new HashMap<Integer, Realm>();
            data = JDBCUtils.loadEntitiesData(new Realm(-1)); //области
            for (DBEntity entity : data) {
                Realm realm = new Realm(-1);
                realm.setPrimaryKey(entity.getPrimaryKey());
                realm.setState(entity.getState());
                storage.realmMap.put(realm.getId(), realm);
            }

            storage.themeMap = new HashMap<Integer, Theme>();
            storage.themeMapForRealm = new HashMap<Integer, Map<Integer, Theme>>();
            data = JDBCUtils.loadEntitiesData(new Theme(-1)); //области
            for (DBEntity entity : data) {
                Theme theme = new Theme(-1);
                theme.setPrimaryKey(entity.getPrimaryKey());
                theme.setState(entity.getState());
                storage.themeMap.put(theme.getId(), theme);
                Realm realm = storage.realmMap.get(theme.getInt("realmId")); //извлекаем вручную, т.к. данные только заполняются
                storage.addTheme(theme, realm);
            }
            
            storage.themeQuestionSet = new HashSet<ThemeQuestion>();    
            storage.questionMapForTheme = new HashMap<Integer, Map<Integer, Question>>();    
            storage.themeMapForQuestion = new HashMap<Integer, Map<Integer, Theme>>();    
            data = JDBCUtils.loadEntitiesData(new ThemeQuestion(-1,-1)); //связки тем и вопросов
            for (DBEntity entity : data) {
                ThemeQuestion tq = new ThemeQuestion(-1,-1);
                tq.setPrimaryKey(entity.getPrimaryKey());
                storage.themeQuestionSet.add(tq);
                
                Question question = storage.questionMap.get(tq.getPKInt("questionId")); //извлекаем вручную, т.к. данные только заполняются
                Theme theme = storage.themeMap.get(tq.getPKInt("themeId"));

                storage.linkQuestionTheme(question, theme);

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
