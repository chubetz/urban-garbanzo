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
    
    public static Question getMockQuestion() { //обертка для Question - для jsp
        return mockQuestion;
    }
    
    
    public static Map<Integer, Question> getMap() {
        return Collections.unmodifiableMap(getStorage().getQuestionMap());
    }


    private static Map<Integer, String> availableTypes;
    public static Map<Integer, String> getAvailableTypes() {
        return Collections.unmodifiableMap(availableTypes);
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
        defaultState.put("realmId", -1);
        defaultState.put("type", -1);
        defaultState.put("text", "");

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
    

    public boolean isValid() {
        boolean correctExists = false;
        for (Answer answer: getAnswerMap().values()) {
            if (answer.getBool("correct")) {
                correctExists = true;
                break;
            }
        }
        return (!getStr("text").equals("")) && (getStr("text") != null) && 
                (this.getInt("type") == Question.INFO_TYPE || (correctExists && !getAnswerMap().isEmpty()));
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
        for (Map.Entry<Integer, Question> entry: getStorage().getQuestionMap().entrySet()) {
            if (entry.getValue().isValid()) {
                filteredMap.put(entry.getKey(), entry.getValue());
            }
        }
        return filteredMap;
    }
    
    public Map<Integer, Answer> getAnswerMap() {
        return Collections.unmodifiableMap(getStorage().getAnswerMap(this));
    }
    
    public Realm getRealm() {
        return Realm.getMap().get(this.getInt("realmId"));
    }
    
    public String getAnswersTableHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        for (Map.Entry<Integer, Answer> entry: getAnswerMap().entrySet()) {
            sb.append("<td>");
            String answerText = entry.getValue().getStr("text");
            if (entry.getValue().getBool("correct")) {
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
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(0).getStr("text") + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-1\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 2</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(1).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(1).getStr("text") + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-2\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 3</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(2).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(2).getStr("text") + "</textarea>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<textarea name=\"answer_-3\" rows=\"3\" cols=\"80\"></textarea>\n");
        }
        sb.append("<br>");
        sb.append("<p>Ответ 4</p>\n");
        try {
            sb.append("<textarea name=\"answer_" + answers.get(3).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"80\">" + answers.get(3).getStr("text") + "</textarea>\n");
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
            selected = (answers.get(0).getBool("correct")) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(0).getId() + "\"" + selected + ">Ответ 1</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-1\">Ответ 1</option>\n");
        }
        try {
            selected = (answers.get(1).getBool("correct")) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(1).getId() + "\"" + selected + ">Ответ 2</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-2\">Ответ 2</option>\n");
        }
        try {
            selected = (answers.get(2).getBool("correct")) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(2).getId() + "\"" + selected + ">Ответ 3</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-3\">Ответ 3</option>\n");
        }
        try {
            selected = (answers.get(3).getBool("correct")) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(3).getId() + "\"" + selected + ">Ответ 4</option>\n");
        } catch (IndexOutOfBoundsException e) {
            sb.append("<option value=\"-4\">Ответ 4</option>\n");
        }

        return sb.toString();
    }
    

    public String getTypesHTML() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Integer, String> entry: getAvailableTypes().entrySet()) {
            sb.append("<option value=\"" + entry.getKey() + "\"");
            if (this.getInt("type") == entry.getKey())
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
    
    private static Question mockQuestion = new Question(-100);

    Question(int id) {
        super("Question", id);
    }

    @Override
    public String toString() {
        return "Вопрос {" + getId() + "} " + '{' + getRealm().getStr("text") + "} " + "{" + Question.getTypeText(getInt("type")) + "}";
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
                        getStorage().getAnswerMap(this).remove(answerId);
                        getStorage().getAnswerMap().remove(answerId);
                    }
                    continue;
                }

                Map<String, Object> answerData = new HashMap<String, Object>();
                answerData.put("questionId", this.getId());
                if (Arrays.binarySearch(corrects, ans[1]) >= 0)
                    answerData.put("correct", true);
                else
                    answerData.put("correct", false);
                answerData.put("text", entry.getValue());
                
                Utils.print("answerData", answerData);
                try {
                    Answer answer = Answer.saveAnswer(answerId, answerData);
                    getStorage().addAnswer(answer, this);
                    getStorage().getAnswerMap().put(answer.getId(), answer);
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
            question = new Question(-1);
        }
        if (data != null) {
            if (data.get("realmId").getClass().isArray()) { //список параметров с фронта
                data = Utils.translateWebData( (Map<String, String[]>)data );
            }
            Utils.print("saveQuestion", data);
            question.setState(data);

        }
        Map<String, Object> pk = JDBCUtils.saveEntity(question);
        if (pk != null) { // удалось записать объект в БД
            question.setPrimaryKey(pk);
            getStorage().getQuestionMap().put(question.getId(), question);
            question.saveAnswers(data);
            Utils.print("Question pk: ", pk);
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
    
//    public Map<Integer, Theme> getThemeMap() {
//        return Collections.unmodifiableMap(getStorage().getThemeMap(this.getId()));
//    }

    public void linkThemes(String[] ids) throws JDBCException {
        //сначала убираем из вопроса все имеющиеся темы
        List<Theme> tList = new ArrayList<Theme>(getThemeMap().values());
        for (Theme t: tList) {
            ThemeQuestion link = new ThemeQuestion(t.getId(), this.getId());
            if (link.delete()) { // удалось стереть из базы
                getStorage().unlinkQuestionTheme(this, t);
            }
        }
        
        if (ids != null) {
            for (String themeId: ids) {
                Theme theme = Theme.getById(themeId);
                if (theme != null) {
                    ThemeQuestion link = new ThemeQuestion(theme.getId(), this.getId());
                    if (link.save() == link) { //записалось успешно
                        getStorage().linkQuestionTheme(this, theme);
                    }
                }
            }
        }
    }

    public Map<Integer, Theme> getThemeMap() {
        return Collections.unmodifiableMap(getStorage().getThemeMap(this));
    }

    public String getThemesHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<ul>\r\n");
        for (Theme theme: getThemeMap().values()) {
            sb.append("\t<li>" + theme.getDbl("number") + " " + theme.getStr("text") + "\r\n");
        }
        sb.append("</ul>");
        return sb.toString();
    }
    
}
