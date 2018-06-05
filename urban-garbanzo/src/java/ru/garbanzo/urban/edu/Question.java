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
import ru.garbanzo.urban.db.JDBCUtils;
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
    public static Map<Integer, Question> getQuestionMap() {
        return Collections.unmodifiableMap(questionMap);
    }
    private Map<Integer, Answer> answerMap = new HashMap<Integer, Answer>();
    public Map<Integer, Answer> getAnswerMap() {
        return Collections.unmodifiableMap(answerMap);
    }

    static {
        List<Map<String, Object>> data = JDBCUtils.loadEntitiesData(new Question());
        for (Map<String, Object> entry : data) {
            Question question = new Question();
            question.id = (Integer)entry.get("id");
            question.setState(entry);
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

    private Question() {
    }

    @Override
    public String toString() {
        return "Вопрос {" + id + '}';
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
    
    private void saveAnswers(Map<String, ?> data) {
        for (Map.Entry<String, ?> entry: data.entrySet()) {
            String[] corrects = new String[0];
            if (data.get("correct") != null) {
                corrects = (String[])data.get("correct");
                Arrays.sort(corrects);
            }
            String[] ans = entry.getKey().split("_");
            if ((ans.length == 2) && ans[0].equals("answer")) { // данные ответа
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
    
    public static Question saveQuestionFromWeb(int id, Map<String, String[]> data) {
        return saveQuestion(id, translateWebData(data));
    }
    
    public static Question saveQuestion(int id, Map<String, ?> data) {
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
    
    public static Question createQuestion(Map<String, ?> data) {
        return saveQuestion(-1, data);
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }


    
}
