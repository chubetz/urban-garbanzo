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
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Question extends Entity {
    
    private boolean neededNewAnswer;
    
    public boolean isSaveable() {
        return true;
    }
    
    public static final int INFO_TYPE = 0;
    public static final int TEST_TYPE = 1;
    public static final int COMMON_TYPE = 2;
    
    public static Question getMockQuestion() { //обертка для Question - для jsp
        return mockQuestion;
    }
    
    public static Question getQuestionFromParameterMap(Map<String, ?> data) { //изготовить объект вопроса по параметрам с фронта (и не только)
        if (data.get("realmId").getClass().isArray()) { //список параметров с фронта
            data = Utils.translateWebData( (Map<String, String[]>)data );
        }
        Question question = new MockQuestion(data); //возвращает полностью заполненный объект, с которого можно сгенерить формы для редактирования
        question.neededNewAnswer = true;
        return question;
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
        for (int i=0; i<answers.size(); i++) {
            sb.append("<table width=\"80%\">\n");
            sb.append("<tr>\n");
            sb.append("<td width=\"60%\">Ответ " + (i+1) + "</td>\n");
            sb.append("<td width=\"40%\">" + "Комментарий к ответу" + "</td>\n");
            sb.append("</tr>\n");
            sb.append("<tr>\n");
            sb.append("<td width=\"60%\">");
            sb.append("<textarea style=\"width: 100%;\" name=\"answer_" + answers.get(i).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"40\">" + answers.get(i).getStr("text") + "</textarea>\n");
            sb.append("</td>\n");
            sb.append("<td width=\"40%\">");
            sb.append("<textarea style=\"width: 100%;\" name=\"comment_" + answers.get(i).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"30\">" + answers.get(i).getStr("comment") + "</textarea>\n");
            sb.append("</td>\n");
            sb.append("</tr>\n");
            sb.append("</table><p>\n");
            



        }
        if (neededNewAnswer) { //с фронта прилетел флаг добавления нового ответа
            int answerNum = answers.size()+1;
            sb.append("<table width=\"80%\">\n");
            sb.append("<tr>\n");
            sb.append("<td width=\"60%\">Ответ " + answerNum + "</td>\n");
            sb.append("<td width=\"40%\">" + "Комментарий к ответу" + "</td>\n");
            sb.append("</tr>\n");
            sb.append("<tr>\n");
            sb.append("<td width=\"60%\">");
            sb.append("<textarea style=\"width: 100%;\" name=\"answer_" + (-answerNum) + "\"");
            sb.append(" rows=\"3\" cols=\"40\"></textarea>\n");
            sb.append("</td>\n");
            sb.append("<td width=\"40%\">");
            sb.append("<textarea style=\"width: 100%;\" name=\"comment_" + (-answerNum) + "\"");
            sb.append(" rows=\"3\" cols=\"30\"></textarea>\n");
            sb.append("</td>\n");
            sb.append("</tr>\n");
            sb.append("</table><p>\n");

        }
        sb.append("<br>");

        return sb.toString();
    }

    public String getAnswersCorrectHTML() {
        List<Answer> answers = new ArrayList(getAnswerMap().values());
        StringBuilder sb = new StringBuilder();
        String selected = "";
        for (int i=0; i<answers.size(); i++) {
            selected = (answers.get(i).getBool("correct")) ? "selected" : "";
            sb.append("<option value=\"" + answers.get(i).getId() + "\"" + selected + ">Ответ " + (i+1) + "</option>\n");
        }

        if (neededNewAnswer) { //с фронта прилетел флаг добавления нового ответа
            int answerNum = answers.size()+1;
            sb.append("<option value=\"" + (-answerNum) + "\">Ответ " + answerNum + "</option>\n");
        }

        return sb.toString();
    }

    public int getAnswersSizeForHTML() {
        return getAnswerMap().size() + (neededNewAnswer ? 1 : 0);
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
        for (Answer answer : Answer.getGeneratedFromFrontendAnswerList(data)) {
            if (answer.getStr("text").equals("")) { //ответ надо стереть (если был) или не создавать (если не было)
                Answer realAnswer = getStorage().getAnswerMap().get(answer.getId());
                if (realAnswer != null) {
                    boolean wasDeleted = JDBCUtils.deleteEntity(realAnswer);
                    Utils.print("Стерлось ли?", wasDeleted);
                    if (wasDeleted) { // нужно удалить из памяти
                        getStorage().unregister(realAnswer);
                    }
                }
                continue;
            }

            Map<String, Object> answerData = new HashMap<String, Object>(answer.getState());
            answerData.put("questionId", this.getId());
            try {
                Answer.saveAnswer(answer.getId(), answerData);
            } catch(NoQuestionException nqe) {
                nqe.printStackTrace();
            }
        
        }
        
    }
    
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
            Realm oldRealm = question.getRealm();
            question.setState(data);
            Realm realm = question.getRealm();
            if (realm != null && oldRealm != null && realm.getId() != oldRealm.getId()) {
                for (int themeId: question.getThemeMap().keySet()) {
                    new ThemeQuestion(themeId, question.getId()).delete();
                }
                getStorage().unbind(question, oldRealm);
            }

        }
        Map<String, Object> pk = JDBCUtils.saveEntity(question);
        if (pk != null) { // удалось записать объект в БД
            question.setPrimaryKey(pk);
            getStorage().register(question);
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

//    public Map<Integer, Theme> getThemeMap() {
//        return Collections.unmodifiableMap(getStorage().getThemeMap(this.getId()));
//    }

    public void linkThemes(String[] ids) throws JDBCException {
        //сначала убираем из вопроса все имеющиеся темы
        List<Theme> tList = new ArrayList<Theme>(getThemeMap().values());
        for (Theme t: tList) {
            ThemeQuestion link = new ThemeQuestion(t.getId(), this.getId());
            if (link.delete()) { // удалось стереть из базы
                getStorage().unregisterLink(link);
            }
        }
        
        if (ids != null) {
            for (String themeId: ids) {
                Theme theme = Theme.getById(themeId);
                if (theme != null) {
                    ThemeQuestion link = new ThemeQuestion(theme.getId(), this.getId());
                    if (link.save() == link) { //записалось успешно
                        getStorage().registerLink(link);
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
            sb.append("\t<li>" + theme.getDblStr("number") + " " + theme.getStr("text") + "\r\n");
        }
        sb.append("</ul>");
        return sb.toString();
    }
    
}
