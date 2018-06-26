/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Question extends Entity {
    
    public static final int INFO_TYPE = 0;
    public static final int TEST_TYPE = 1;
    public static final int COMMON_TYPE = 2;
    
    private static MockQuestion mockQuestion = new MockQuestion(new Question());
    
    public static MockQuestion getMockQuestion() { //обертка для Question - для jsp
        return mockQuestion;
    }
    
    
    public static Map<Integer, Question> getMap() {
        acquireStorage();
        return Collections.unmodifiableMap(storage.getQuestionMap());
    }
    private static Map<Integer, Question> getEditableMap() {
        acquireStorage();
        return storage.getQuestionMap();
    }


    private static Map<Integer, String> availableTypes;
    public static Map<Integer, String> getAvailableTypes() {
        return Collections.unmodifiableMap(availableTypes);
    }
    
    static {
        availableTypes = new HashMap<Integer, String>();
        availableTypes.put(INFO_TYPE, "Информационный"); //односторонняя флеш-карточка
        availableTypes.put(TEST_TYPE, "Тест");
        availableTypes.put(COMMON_TYPE, "Общий"); //двусторонняя флеш-карточка
    }

    public static String getTypeText(Object keyObj) {
        Integer key = 0;
        if (keyObj instanceof String) {
            key = Integer.parseInt((String)keyObj);
        } else if (keyObj instanceof Integer) {
            key = (Integer)keyObj;
        } else {
            throw new RuntimeException("Аргумент должен быть Integer или String");
        }
            
        return getAvailableTypes().get(key);
    }
    
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
        boolean correctExists = false;
        for (Answer answer: getAnswerMap().values()) {
            if (answer.isCorrect()) {
                correctExists = true;
                break;
            }
        }
        return (!text.equals("")) && (text != null) && 
                (this.getType() == Question.INFO_TYPE || (correctExists && getAnswerMap().size() != 0));
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
    
    
    public static Question getById(Object id){
        if (id instanceof String)
            return getMap().get(Integer.parseInt((String)id));
        else
            return getMap().get((Integer)id);
    }

    public static Question getById(int id){
        return Question.getById(new Integer(id));
    }

    public static Map<Integer, Question> getValidMap() throws JDBCException {
        Map<Integer, Question> filteredMap = new HashMap<Integer, Question>();
        for (Map.Entry<Integer, Question> entry: storage.getQuestionMap().entrySet()) {
            if (entry.getValue().isValid()) {
                filteredMap.put(entry.getKey(), entry.getValue());
            }
        }
        return filteredMap;
    }
    
    public Map<Integer, Answer> getAnswerMap() {
        acquireStorage();
        return Collections.unmodifiableMap(storage.getAnswerMap(id));
    }
    private Map<Integer, Answer> getEditableAnswerMap() { //эту мапу можно редактировать
        acquireStorage();
        return storage.getAnswerMap(id);
    }
    
    public String getAnswersTableHTML() {
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

    public String getAnswersEditHTML() {
        List<Answer> answers = new ArrayList(getAnswerMap().values());
        StringBuilder sb = new StringBuilder();
        sb.append("<p>Ответ 1</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(0).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(0).getText() + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-1\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 2</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(1).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(1).getText() + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-2\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 3</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(2).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(2).getText() + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-3\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 4</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(3).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(3).getText() + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-4\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");

        return sb.toString();
    }

    public String getAnswersCorrectHTML() {
        List<Answer> answers = new ArrayList(getAnswerMap().values());
        StringBuilder sb = new StringBuilder();
        String selected = "";
        try {
            selected = (answers.get(0).isCorrect()) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(0).getId() + "\"" + selected + ">Ответ 1</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-1\">Ответ 1</option>\n");
        }
        try {
            selected = (answers.get(1).isCorrect()) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(1).getId() + "\"" + selected + ">Ответ 2</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-2\">Ответ 2</option>\n");
        }
        try {
            selected = (answers.get(2).isCorrect()) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(2).getId() + "\"" + selected + ">Ответ 3</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-3\">Ответ 3</option>\n");
        }
        try {
            selected = (answers.get(3).isCorrect()) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(3).getId() + "\"" + selected + ">Ответ 4</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-4\">Ответ 4</option>\n");
        }

        return sb.toString();
    }
    
    private Map<String, String> getAvailableRealms() {
        Map<String, String> map = new HashMap<String, String>();
        for (Realm realm: Realm.getMap().values()) {
            map.put(realm.getStr("text"), realm.getStr("description"));
        }
        return map;
    }

    public String getRealmsHTML() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry: getAvailableRealms().entrySet()) {
            sb.append("<option value=\"" + entry.getKey() + "\"");
            if (this.getRealm().equals(entry.getKey()))
                sb.append(" selected");
            sb.append(">" + entry.getValue() + "</option>\n");
        }
        return sb.toString();
    }

    public String getTypesHTML() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Integer, String> entry: getAvailableTypes().entrySet()) {
            sb.append("<option value=\"" + entry.getKey() + "\"");
            if (this.getType() == entry.getKey())
                sb.append(" selected");
            sb.append(">" + entry.getValue() + "</option>\n");
        }
        return sb.toString();
    }


    /**
     * Get the value of id
     *
     * @return the value of id
     */
    public int getId() {
        return id;
    }
    
    private Question() {}

    Question(int id) {
        this.id = id;
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
        Utils.print("sae answers 1", data);
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
            if ((ans.length == 2) && ans[0].equals("answer")) { // данные ответа
                
                int answerId = Integer.parseInt(ans[1]);

                if (entry.getValue().equals("")) { // ответ надо стереть (если был) или не создавать (если не было)
                    boolean wasDeleted = JDBCUtils.deleteEntity(new Answer(answerId));
                    Utils.print("Стерлось ли?", wasDeleted);
                    if (wasDeleted) { // нужно удалить из памяти
                        getEditableAnswerMap().remove(answerId);
                        storage.getAnswerMap().remove(answerId);
                    }
                    continue;
                }

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
                    getEditableAnswerMap().put(answer.getId(), answer);
                    storage.getAnswerMap().put(answer.getId(), answer);
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
        Question question = getMap().get(id);
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
            getEditableMap().put(question.id, question);
            Utils.print("НАДО ВКЛЮЧИТЬ saveAnswers!!!!");
            question.saveAnswers(data);
            Utils.print("validId: " + validId);
        } else {
            return null;
        }
            
        return question;
    }
    
    public static Question saveQuestion(String id, Map<String, ?> data) throws JDBCException {
        return saveQuestion(Integer.parseInt(id), data);
    }

    public static Question createQuestion(Map<String, ?> data) throws JDBCException {
        return saveQuestion(-1, data);
    }

    @Override
    public String getTableName() {
        return this.tableName;
    }


    
}
