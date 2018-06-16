/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.Util;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Question implements DBEntity {
    
    public static final int INFO_TYPE = 0;
    public static final int TEST_TYPE = 1;
    public static final int COMMON_TYPE = 2;
    
    private static Map<Integer, String> typeText = new HashMap<Integer, String>();
    
    public static String getTypeText(Object keyObj) {
        Integer key = 0;
        if (keyObj instanceof String) {
            key = Integer.parseInt((String)keyObj);
        } else if (keyObj instanceof Integer) {
            key = (Integer)keyObj;
        } else {
            throw new RuntimeException("Аргумент должен быть Integer или String");
        }
            
        if (!typeText.containsKey(key)) {
            switch (key) {
                case INFO_TYPE:
                    typeText.put(key, "Информационный");
                    break;
                case TEST_TYPE:
                    typeText.put(key, "Тест");
                    break;
                case COMMON_TYPE:
                    typeText.put(key, "Общий");
                    break;
            }
        }
        return typeText.get(key);
    }
    
    private static Exception staticException;
    
    private int id = -1;
    private final String tableName = "Question";
    private Map<String, Object> state = new LinkedHashMap<String, Object>();

    private String realm = "";
    private int type = -1;
    private String text = "";
    public String getRealm() {
        return realm;
    }

    public int getType() {
        return type;
    }

    public String getText() {
        return text;
    }
    
    public boolean isValid() {
        return (text != "") && (getAnswerMap().size() != 0);
    }

    @Override
    synchronized public Map<String, Object> getState() {
        state.put("realm", realm);
        state.put("type", type);
        state.put("text", text);
        return state;
    }
    @Override
    synchronized public void setState(Map<String, ?> map) {
        this.realm = (String)map.get("realm");
        int type = -1;
        if (map.get("type") instanceof String) {
            type = Integer.parseInt( (String)map.get("type") );
        } else if (map.get("type") instanceof Integer) {
            type = (Integer)map.get("type");
        }
        this.type = type;
        this.text = (String)map.get("text");
    }
    
    private static Map<Integer, Question> questionMap = new HashMap<Integer, Question>();
    public static Map<Integer, Question> getQuestionMap() throws JDBCException {
        if (staticException instanceof JDBCException) { // при инициализации класса что-то случилось с БД
            throw (JDBCException)staticException;
        }
        return Collections.unmodifiableMap(questionMap);
    }
    
    public static Question getQuestionById(Object id){
        try {
            if (id instanceof String)
                return getQuestionMap().get(Integer.parseInt((String)id));
            else
                return getQuestionMap().get((Integer)id);
        } catch (JDBCException ex) { //сюда не должны попасть
            return null; 
        }
    }

    public static Question getQuestionById(int id){
        return getQuestionById(new Integer(id));
    }

    public static Map<Integer, Question> getValidQuestionMap() throws JDBCException {
        Map<Integer, Question> filteredMap = new HashMap<Integer, Question>();
        for (Map.Entry<Integer, Question> entry: questionMap.entrySet()) {
            if (entry.getValue().isValid()) {
                filteredMap.put(entry.getKey(), entry.getValue());
            }
        }
        return filteredMap;
    }
    
    private Map<Integer, Answer> answerMap = new HashMap<Integer, Answer>();
    public Map<Integer, Answer> getAnswerMap() {
        return Collections.unmodifiableMap(answerMap);
    }
    
    public String getAnswersHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        for (Map.Entry<Integer, Answer> entry: getAnswerMap().entrySet()) {
            sb.append("<td>");
            String answerText = entry.getValue().getText();
            if (entry.getValue().isCorrect()) {
                answerText = "<b>" + answerText + "</b>";
            }
            sb.append(answerText);
            sb.append("</td>");
        }
        sb.append("</tr>");
        return sb.toString();
    }

    static {
        try {
            List<Map<String, Object>> data = JDBCUtils.loadEntitiesData(new Question());
            for (Map<String, Object> entry : data) {
                Question question = new Question();
                question.id = (Integer)entry.get("id");
                question.setState(entry);
                questionMap.put(question.id, question);
            }
            data = JDBCUtils.loadEntitiesData(new Answer(-1)); //ответы
            for (Map<String, Object> entry : data) {
                Answer answer = new Answer((Integer)entry.get("id"));
                answer.setState(entry);
                Question question = questionMap.get(answer.getQuestionId());
                if (question != null) {
                    question.answerMap.put(answer.getId(), answer);
                }
            }
        } catch (JDBCException ex) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, ex);
            staticException = ex;
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

    private Question() {
    }

    @Override
    public String toString() {
        return "Вопрос {" + id + "} " + '{' + realm + "} " + "{" + Question.getTypeText(type) + "}";
    }
    
    private static Map<String, Object> translateWebData(Map<String, String[]> data) {
        Map<String, Object> tmp = new HashMap<>();
        for (String key: data.keySet()) {
            String[] current = data.get(key);
            if (current.length == 1) {
                tmp.put(key, current[0]);
            } else {
                tmp.put(key, current);
            }
        }
        return tmp;
    }
    
    private void saveAnswers(Map<String, ?> data) throws JDBCException {
        for (Map.Entry<String, ?> entry: data.entrySet()) {
            String[] corrects = new String[0];
            if (data.get("correct") != null) {
                try {
                    corrects = (String[])data.get("correct");
                } catch (ClassCastException cce) {
                    corrects = new String[] {(String)data.get("correct")};
                }
                Arrays.sort(corrects);
            }
            String[] ans = entry.getKey().split("_");
            if ((ans.length == 2) && ans[0].equals("answer") && !entry.getValue().equals("")) { // данные ответа
                int answerId = Integer.parseInt(ans[1]);
                Map<String, Object> answerData = new HashMap<String, Object>();
                answerData.put("questionId", this.id);
                if (Arrays.binarySearch(corrects, ans[1]) >= 0)
                    answerData.put("correct", true);
                else
                    answerData.put("correct", false);
                answerData.put("text", entry.getValue());
                
                Utils.print("answerData", answerData);
                try {
                    Answer answer = Answer.saveAnswer(answerId, answerData);
                    this.answerMap.put(answer.getId(), answer);
                } catch(NoQuestionException nqe) {
                    nqe.printStackTrace();
                }
            }
            
        }
    }
    
//    public static Question saveQuestionFromWeb(int id, Map<String, String[]> data) {
//        return saveQuestion(id, translateWebData(data));
//    }
    
    public static Question saveQuestion(int id, Map<String, ?> data) throws JDBCException {
        Question question = questionMap.get(id);
        if (question == null) {
            question = new Question();
        }
        if (data != null) {
            if (data.get("realm").getClass().isArray()) { //список параметров с фронта
                data = translateWebData( (Map<String, String[]>)data );
            }
            Utils.print("saveQuestion", data);
            question.setState(data);

        }
        int validId = JDBCUtils.saveEntity(question);
        if (validId >= 0) { // удалось записать объект в БД с валидным id
            question.id = validId;
            questionMap.put(question.id, question);
            question.saveAnswers(data);
            Utils.print("validId: " + validId);
        } else {
            return null;
        }
            
        return question;
    }
    
    public static Question createQuestion(Map<String, ?> data) throws JDBCException {
        return saveQuestion(-1, data);
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }


    
}
