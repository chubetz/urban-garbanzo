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
import static ru.garbanzo.urban.edu.Question.NB_TYPE;
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
    private Map<Integer, Image> imageMap;    
    private Set<ThemeQuestion> themeQuestionSet;    
    private Map<Integer, Map<Integer, Question>> questionMapForTheme;    
    private Map<Integer, Map<Integer, Question>> questionMapForRealm;    
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

    Set<ThemeQuestion> getThemeQuestionSet() {
        return themeQuestionSet;
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
    
    Map<Integer, Theme> getThemeMap(Realm realm) { //для вопросов
        int realmId = realm.getId();
        provideDefaultMap(themeMapForRealm, realmId);
        if (realmId >= 0) {
            return themeMapForRealm.get(realmId);
        } else {
            return new HashMap<Integer, Theme>();
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

    Map<Integer, Image> getImageMap() {
        return imageMap;
    }

    private Storage() {}
    
    static Storage getStorage() {
        return storage;
    }
    
    void register(Realm realm) {
        realmMap.put(realm.getId(), realm);
    }
    void register(Question question) {
        questionMap.put(question.getId(), question);
        
        int realmId = question.getInt("realmId");
        if (realmMap.get(realmId) ==  null)
            throw new RuntimeException("Область с идентификатором " + realmId + ", для которой производится попытка зарегистрировать вопрос, не найдена в памяти");
        provideDefaultMap(questionMapForRealm, realmId);
        questionMapForRealm.get(realmId).put(question.getId(), question);
            
    }
    void unbind(Question question, Realm realm) {
        provideDefaultMap(questionMapForRealm, realm.getId());
        Map map = questionMapForRealm.get(realm.getId());
        if (map != null)
            map.remove(question.getId());
        Integer[] themeIds = question.getThemeMap().keySet().toArray(new Integer[0]);
        for (int themeId: themeIds) { //стираем связи с темами
            unregisterLink(new ThemeQuestion(themeId, question.getId()));
        }
        
    }
    void register(Answer answer) {
        answerMap.put(answer.getId(), answer);
        
        int questionId = answer.getInt("questionId");
        if (questionMap.get(questionId) == null)
            throw new RuntimeException("Ответ с идентификатором " + questionId + ", для которого производится попытка зарегистрировать ответ, не найден в памяти");
        provideDefaultMap(answerMapForQuestion, questionId);
        answerMapForQuestion.get(questionId).put(answer.getId(), answer);
    }
    void unregister(Answer answer) {
        answerMap.remove(answer.getId());
        int questionId = answer.getInt("questionId");
        provideDefaultMap(answerMapForQuestion, questionId);
        Map map = answerMapForQuestion.get(questionId);
        if (map != null)
            map.remove(answer.getId());
    }
    void register(Theme theme) {
        themeMap.put(theme.getId(), theme);
        
        int realmId = theme.getInt("realmId");
        if (realmMap.get(realmId) == null)
            throw new RuntimeException("Область с идентификатором " + realmId + ", для которой производится попытка зарегистрировать тему, не найдена в памяти");
        provideDefaultMap(themeMapForRealm, realmId);
        themeMapForRealm.get(realmId).put(theme.getId(), theme);
    }
    void register(Image image) {
        imageMap.put(image.getId(), image);
    }
    void unbind(Theme theme, Realm realm) {
        provideDefaultMap(themeMapForRealm, realm.getId());
        Map map = themeMapForRealm.get(realm.getId());
        if (map != null)
            map.remove(theme.getId());
        Integer[] questionIds = theme.getQuestionMap().keySet().toArray(new Integer[0]);
        for (int questionId: questionIds) { //стираем связи с вопросами
            unregisterLink(new ThemeQuestion(theme.getId(), questionId));
        }
        
    }
    void registerLink(ThemeQuestion tq) {
        themeQuestionSet.add(tq);
        int questionId = tq.getPKInt("questionId");
        int themeId = tq.getPKInt("themeId");
        Question question = getQuestionMap().get(questionId);
        if (question == null)
            throw new RuntimeException("Вопрос с идентификатором " + questionId + ", который связывается с темой, не найден в памяти");
        Theme theme = getThemeMap().get(themeId);
        if (theme == null)
            throw new RuntimeException("Тема с идентификатором " + themeId + ", которая связывается с вопросом, не найдена в памяти");
        provideDefaultMap(themeMapForQuestion, questionId);
        provideDefaultMap(questionMapForTheme, themeId);
        Utils.print("ThemeQuestion hashcode " + tq, tq.hashCode());
        themeMapForQuestion.get(questionId).put(themeId, theme);
        questionMapForTheme.get(themeId).put(questionId, question);
        
    }
    
    void unregisterLink(ThemeQuestion tq) {
        int questionId = tq.getPKInt("questionId");
        int themeId = tq.getPKInt("themeId");
        provideDefaultMap(themeMapForQuestion, questionId);
        provideDefaultMap(questionMapForTheme, themeId);
        themeQuestionSet.remove(tq);
        themeMapForQuestion.get(questionId).remove(themeId);
        questionMapForTheme.get(themeId).remove(questionId);
        
    }

    public static void init() {
        storage = new Storage();
        List<DBEntity> data;

        try {
            storage.jdbcException = null; //сносим исключение, хранившееся с момента предыдущего неудачного запуска
            
            storage.realmMap = new HashMap<Integer, Realm>();
            data = JDBCUtils.loadEntitiesData(new Realm(-1)); //области
            for (DBEntity entity : data) {
                Realm realm = new Realm(-1);
                realm.setPrimaryKey(entity.getPrimaryKey());
                realm.setState(entity.getState());
                storage.register(realm);
            }

            storage.questionMap = new HashMap<Integer, Question>();
            storage.questionMapForRealm = new HashMap<Integer, Map<Integer, Question>>();
            data = JDBCUtils.loadEntitiesData(new Question(-1));
            for (DBEntity entity : data) {
                Question question = new Question(-1);
                question.setPrimaryKey(entity.getPrimaryKey());
                question.setState(entity.getState());
                storage.register(question);
            }
            
            storage.answerMap = new HashMap<Integer, Answer>();
            storage.answerMapForQuestion = new HashMap<Integer, Map<Integer, Answer>>();
            data = JDBCUtils.loadEntitiesData(new Answer(-1)); //ответы
            for (DBEntity entity : data) {
                Answer answer = new Answer(-1);
                answer.setPrimaryKey(entity.getPrimaryKey());
                answer.setState(entity.getState());
                storage.register(answer);
            }
    

            storage.themeMap = new HashMap<Integer, Theme>();
            storage.themeMapForRealm = new HashMap<Integer, Map<Integer, Theme>>();
            data = JDBCUtils.loadEntitiesData(new Theme(-1)); //области
            for (DBEntity entity : data) {
                Theme theme = new Theme(-1);
                theme.setPrimaryKey(entity.getPrimaryKey());
                theme.setState(entity.getState());
                storage.register(theme);
            }
            
            storage.themeQuestionSet = new HashSet<ThemeQuestion>();    
            storage.questionMapForTheme = new HashMap<Integer, Map<Integer, Question>>();    
            storage.themeMapForQuestion = new HashMap<Integer, Map<Integer, Theme>>();    
            data = JDBCUtils.loadEntitiesData(new ThemeQuestion(-1,-1)); //связки тем и вопросов
            for (DBEntity entity : data) {
                ThemeQuestion tq = new ThemeQuestion(-1,-1);
                tq.setPrimaryKey(entity.getPrimaryKey());
                storage.registerLink(tq);

            }
            
            storage.imageMap = new HashMap<Integer, Image>();
            data = JDBCUtils.loadEntitiesData(new Image(-1)); //изображения
            for (DBEntity entity : data) {
                Image image = new Image(-1);
                image.setPrimaryKey(entity.getPrimaryKey());
                image.setState(entity.getState());
                storage.register(image);
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
