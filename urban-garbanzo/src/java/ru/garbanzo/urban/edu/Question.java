/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 * Сущность "Карточка"
 * @author d.gorshenin
 */
public class Question extends Entity implements ITreeElement, Comparable<Question> {
    
    private boolean neededNewAnswer;
    
    private int themeIdForNewQuestion = -100;
    
    private Set<ThemeQuestion> themeQuestionSet = new HashSet<>();
    
    private UserAnswer lastUserAnswer; 
    
    private Set availableImagesSet; //изображения, которые можно вставить в текст карточки

    public UserAnswer getLastUserAnswer() {
        return lastUserAnswer;
    }

    public void setLastUserAnswer(UserAnswer lastUserAnswer) {
        this.lastUserAnswer = lastUserAnswer;
    }
    
    public boolean isWeak() {
        return lastUserAnswer != null && !lastUserAnswer.getBool("correct");
    }
    
    public ThemeQuestion getThemeQuestion(Theme theme) {
        Optional<ThemeQuestion> opt = themeQuestionSet.stream()
                .filter(t -> t.getPKInt("themeId") == theme.getId())
                .findFirst();
        return opt.orElse(null);
    }
    
    void addThemeQuestion(ThemeQuestion tq) {
        themeQuestionSet.add(tq);
    }
    
    void removeThemeQuestion(ThemeQuestion tq) {
        themeQuestionSet.remove(tq);
    }
    
    public boolean isSaveable() {
        return true;
    }
    
    public static final int NB_TYPE = 0;
    public static final int TEST_TYPE = 1;
    public static final int COMMON_TYPE = 2;
    
    public static Question getMockQuestion() { //обертка для Question - для jsp
        return new Question(-100);
    }
    
    public static Question getMockQuestion(String realmId, String themeId) { //обертка для Question - для jsp
        //должно быть либо realmId, либо themeId
        Question question = getMockQuestion();
        Map<String, Object> state = new HashMap<String, Object>();
        if (realmId != null && Realm.getById(realmId) != null)
            state.put("realmId", Integer.parseInt(realmId));
        else if (themeId != null) {
            Theme theme = Theme.getById(themeId);
            if (theme != null) {
                state.put("realmId", theme.getRealm().getId());
                question.themeIdForNewQuestion = theme.getId();
            }
                
        }
        question.setState(state);
        return question;
    }
    
    public int getNewThemeId() { //параметр для формы редактирования нового вопроса - чтобы сразу
        //связать его с темой
        return this.themeIdForNewQuestion;
    }

    public static Question getQuestionFromParameterMap(Map<String, ?> data) { //изготовить объект вопроса по параметрам с фронта (и не только)
        if (data.get("realmId").getClass().isArray()) { //список параметров с фронта
            data = Utils.translateWebData( (Map<String, String[]>)data );
        }
        Question question = new MockQuestion(data); //возвращает полностью заполненный объект, с которого можно сгенерить формы для редактирования
        question.neededNewAnswer = true;
        if (data.get("newThemeId") != null) {
            question.themeIdForNewQuestion = Integer.parseInt((String)data.get("newThemeId"));
        }

        //даты создания и изменения берем из реального вопроса (если есть) - эти данные не передаются с формы
        Question realQuestion = getStorage().getQuestionMap().get(question.getId());
        if (realQuestion != null) {
            question.setStateValue("regDate", realQuestion.getRegDate());
            question.setStateValue("updateDate", realQuestion.getUpdateDate());
            
        }

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
        defaultState.put("regDate", new Date(0));
        defaultState.put("updateDate", new Date(0));

        availableTypes = new HashMap<Integer, String>();
        availableTypes.put(NB_TYPE, "Nota bene"); //односторонняя флеш-карточка
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
        boolean result = false;
        boolean hasText = getText() != null && !getText().isEmpty();
        switch (getType()) {
            case Question.COMMON_TYPE:
                result = correctExists
                        && hasText
                        && getAnswerMap().size() == 1;
                break;
            case Question.TEST_TYPE:
                result = correctExists
                        && hasText;
                break;
            case Question.NB_TYPE:
                result = hasText && getAnswerMap().isEmpty();
        }
        
        return result;
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
            sb.append(" rows=\"3\" cols=\"40\">" + answers.get(i).getStrLtGt("text") + "</textarea>\n");
            sb.append("</td>\n");
            sb.append("<td width=\"40%\">");
            sb.append("<textarea style=\"width: 100%;\" name=\"comment_" + answers.get(i).getId() + "\"");
            sb.append(" rows=\"3\" cols=\"30\">" + answers.get(i).getStrLtGt("comment") + "</textarea>\n");
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
    
    //private static Question mockQuestion = new Question(-100);

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
        
        Date date = new java.sql.Date(System.currentTimeMillis());
        if (question.getId() == -1) { //новый вопрос
            question.setStateValue("regDate", date);
        }
        question.setStateValue("updateDate", date);
        
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
        Map<ThemeQuestion, Integer> orderNumByLink = new HashMap<>();
        for (Theme t: tList) {
            ThemeQuestion link = new ThemeQuestion(t.getId(), this.getId());
            if (link.delete()) { // удалось стереть из базы
                //сохраняем порядковый номер вопроса в теме - вдруг связка останется
                orderNumByLink.put(link, this.getOrderNum(t));

                getStorage().unregisterLink(link);
                
            }
        }
        
        if (ids != null) {
            for (String themeId: ids) {
                Theme theme = Theme.getById(themeId);
                if (theme != null) {
                    ThemeQuestion link = new ThemeQuestion(theme.getId(), this.getId());

                    //восстанавливаем номер вопроса в теме.
                    // если тема новая - ставим вопрос на последнее место
                    if (orderNumByLink.containsKey(link))
                        link.setStateValue("orderNum", orderNumByLink.get(link));
                    else
                        link.setStateValue("orderNum", theme.getQuestionMap().size() + 1);

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
            sb.append("\t<li>" + theme.getProfileLink(theme.getDblStr("number") + " " + theme.getStr("text"), "0") + "\r\n");
        }
        sb.append("</ul>");
        return sb.toString();
    }
    public String getExamHTML() {
        StringBuilder sb = new StringBuilder();
        switch (getType()) {
            case Question.NB_TYPE:
                sb.append("<table background=\"images/fon_nota_bene.jpg\" width=\"100%\" cellpadding=10 cellspacing=10>\n");
                sb.append("<tr>\n");
                sb.append("<td bgcolor=#FCFCC0 style=\"font-family:Arial;\">\n");
                sb.append(getText());
                sb.append("</td>\n");
                sb.append("</tr>\n");
                sb.append("</table>\n");
                break;
            case Question.COMMON_TYPE:
                sb.append("<table bgcolor=blue width=\"100%\" cellpadding=10 cellspacing=3>\n");
                sb.append("<tr>\n");
                sb.append("<td bgcolor=#D4F2F7 style=\"font-family:Arial;\">\n");
                sb.append(getText());
                sb.append("</td>\n");
                sb.append("</tr>\n");
                sb.append("</table>\n");
                break;
            case Question.TEST_TYPE:
                sb.append("<table bgcolor=#21A211 width=\"100%\" cellpadding=10 cellspacing=3>\n");
                sb.append("<tr>\n");
                sb.append("<td bgcolor=#D3F4C7 style=\"font-family:Arial;\">\n");
                sb.append(getText());
                sb.append("</td>\n");
                sb.append("</tr>\n");
                sb.append("</table>\n");
                break;
        }
        return sb.toString();
    }
    
    public String getText() {
        return getStr("text");
    }
    
    public int getType() {
        return getInt("type");
    }

    public String getTypeText() {
        return Question.getTypeText(this.getType());
    }
    
    public Date getRegDate() {
        return getDte("regDate");
    }
    
    public String getRegDateStr() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(this.getRegDate());
    }
    
    public Date getUpdateDate() {
        return getDte("updateDate");
    }
    
    public String getUpdateDateStr() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(this.getUpdateDate());
    }

    public List<Answer> getAnswersShuffled() {
        List<Answer> list = new ArrayList<Answer>(getAnswerMap().values());
        Collections.shuffle(list);
        return list;
    }
    
    public int getThemeQuestionOrderNum(Theme theme) {
        ThemeQuestion tq = getThemeQuestion(theme);
        if (tq != null) {
            return tq.getInt("orderNum");
        } else {
            return -1;
        }
    }

    public int getOrderNum(Theme theme) {
        
        ThemeQuestion tq = getThemeQuestion(theme);
        if (tq != null) {
            Collection<Question> questions = theme.getQuestionMap().values();
            List<Question> sortedQuestions = questions.stream()
                    .sorted(theme.getQuestionComparator()).collect(Collectors.toList());
            return Collections.binarySearch(sortedQuestions, this, theme.getQuestionComparator()) + 1;
        } else {
            return -1;
        }
    }
    
    public boolean isReal() {
        return getType() != Question.NB_TYPE;
    }
    

    @Override
    public List<ITreeElement> getTreeElements() {
        return new ArrayList<ITreeElement>();
    }

    @Override
    public TreeSign getTreeSign() {
        treeSign.setId(getTableName() + "_" + getId());
        treeSign.setTableBgcolor("#BECF17");
        treeSign.setTdBgcolor("#EDF59E");
        StringBuilder sb = new StringBuilder();
        sb.append("<table width=\"500\" bgcolor=\"" + treeSign.getTableBgcolor() + "\" cellspacing=1><tr><td bgcolor=\"" + treeSign.getTdBgcolor() + "\" style=\"font-family:Tahoma; font-size:10px;\">");
        sb.append(this.getText());
        sb.append("</tr></td></table>");
        treeSign.setName(sb.toString());
        
        switch (getType()) {
            case NB_TYPE:
                treeSign.setTabCellBackground("images/fon_nota_bene.jpg");
                break;
            case TEST_TYPE:
                treeSign.setTabCellBackground("images/fon_test.jpg");
                break;
            case COMMON_TYPE:
                treeSign.setTabCellBackground("images/fon_common.jpg");
                break;
        }
        treeSign.setEditLink("controller?action=load_edit_form&id=" + getId());
        //treeSign.setProfileLink(getProfileURL());

        return treeSign;
    }
    
    @Override
    public int compareTo(Question obj) {
        Comparator<Question> c = Comparator.<Question,Date>comparing(q -> q.getRegDate()).thenComparing(q -> q.getId());
        return c.compare(this, obj);
    }
}
