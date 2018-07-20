/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.function.Consumer;
import ru.garbanzo.urban.exception.NoMoreQuestionException;
import ru.garbanzo.urban.util.Utils;

/**
 *
 * @author d.gorshenin
 */
public class Exam implements Iterator<Question> {
    
    private List<Question> questionSequence;
    private Iterator<Question> iterator;
    private Question current;
    private QuestionState qState;
    private int counter;
    private Theme theme;
    private Map<Integer, Boolean> userAnswers;
    private List<Answer> answers;
    
    @Override
    public boolean hasNext() {
        return iterator.hasNext();
    }

    @Override
    public Question next() {
        counter++;
        try {
            current = iterator.next();
        } catch (NoSuchElementException ex) {
            throw new NoMoreQuestionException();
        }
        qState = QuestionState.New;
        userAnswers = new HashMap<Integer, Boolean>();
        answers = current.getAnswersShuffled();
        return current;

    }
    
    public int getNum() {
        return counter;
    }
    
    public int getRemaining() {
        return questionSequence.size() - counter;
    }
    
    public Question getQuestion() {
        return current;
    }

    public Exam(Theme theme) {
        this.theme = theme;
        questionSequence = new ArrayList(theme.getQuestionMap().values());
        Collections.shuffle(questionSequence);
        iterator = questionSequence.iterator();
    }
    
    public Theme getTheme() {
        return theme;
    }
    
    public String getNextButtonHTML() {
        
        
        String disabled = "";
        if ((current.getType() == Question.COMMON_TYPE && qState == QuestionState.New) ||
                (qState == QuestionState.AnswerShowed)) {
            disabled = "disabled";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
"                        <input type=\"hidden\" name=\"id\" value=\"" + theme.getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
"                        <input type=\"hidden\" name=\"subAction\" value=\"" + (hasNext() ? "next" : "stop") + "\">\n" +
"                        <input type=\"Submit\" value=\"" + (hasNext() ? "Далее" : "Завершить") + "\" " + disabled +">\n" +
"                    </form>\n" +
"");
        return sb.toString();
        
    }

    public String getAnswerHTML() {
        StringBuilder sb = new StringBuilder();
        switch (current.getType()) {
            case Question.NB_TYPE:
                sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
        "                        <input type=\"hidden\" name=\"id\" value=\"" + theme.getId() + "\">\n" +
        "                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
        "                        <input type=\"hidden\" name=\"subAction\" value=\"next\">\n" +
        "                        <input type=\"Submit\" value=\"Далее\">\n" +
        "                    </form>\n" +
        "");
                break;
            case Question.COMMON_TYPE:
                switch (qState) {
                    case New:
                        sb.append("<table width=\"100%\">\n");
                        sb.append("<tr>\n");
                        sb.append("<td align=center>");
                        sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
"                        <input type=\"hidden\" name=\"id\" value=\"" + getTheme().getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
"                        <input type=\"hidden\" name=\"subAction\" value=\"showAnswer\">\n" +
"                        <input type=\"Submit\" value=\"Показать ответ\">\n" +
"                    </form>\n" +
"");
                        sb.append("</td>\n");
                        sb.append("</tr>\n");
                        sb.append("</table>\n");
                        break;
                    case AnswerShowed:
                        sb.append("<table bgcolor=green width=\"100%\" cellpadding=10 cellspacing=3>\n");
                        sb.append("<tr>\n");
                        sb.append("<td bgcolor=#E6FDFE style=\"font-family:Arial; color:#48050C\">\n");
                        sb.append(current.getAnswerMap().values().toArray(new Answer[0])[0].getText());
                        sb.append("</td>\n");
                        sb.append("</tr>\n");
                        sb.append("<tr>\n");
                        sb.append("<td bgcolor=white align=center>\n");
                        sb.append("<b style=\"font-size:18px;\">Верно ли Вы ответили?</b>");
                        sb.append("</td>\n");
                        sb.append("</tr>\n");
                        sb.append("</table>\n");
                        sb.append("<table>\n");
                        sb.append("<tr>\n");
                        sb.append("<td width=\"50%\">\n");
                        sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
"                        <input type=\"hidden\" name=\"id\" value=\"" + getTheme().getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
"                        <input type=\"hidden\" name=\"subAction\" value=\"yesAnswer\">\n" +
"                        <input type=\"Submit\" value=\"Да\">\n" +
"                    </form>\n" +
"");
                        sb.append("</td>\n");
                        sb.append("<td width=\"50%\">\n");
                        sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
"                        <input type=\"hidden\" name=\"id\" value=\"" + getTheme().getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
"                        <input type=\"hidden\" name=\"subAction\" value=\"noAnswer\">\n" +
"                        <input type=\"Submit\" value=\"Нет\">\n" +
"                    </form>\n" +
"");
                        sb.append("</td>\n");
                        sb.append("</tr>\n");
                        sb.append("</table>\n");
                    break;
                }
                break;
            case Question.TEST_TYPE:
                switch (qState) {
                    case New:
                        sb.append("<form method=\"POST\" action=\"doActive\">\n");
                        sb.append("<table bgcolor=#CD7A18 width=\"100%\" cellpadding=10 cellspacing=3>\n");
                        int counter = 0;
                        StringBuilder row = new StringBuilder();
                        Iterator<Answer> answerIterator = answers.iterator();
                        while (answerIterator.hasNext()) {
                            counter++;
                            Answer answer = answerIterator.next();
                            row.append("<td bgcolor=#FAF5F5 width=\"5%\">\n");
                            row.append("<input type=\"checkbox\" name=\"answer_" + answer.getId() + "\">");
                            row.append("</td>\n");
                            row.append("<td width=\"45%\" bgcolor=#FAF5F5 style=\"font-family:Arial; color:#48050C\">\n");
                            row.append(answer.getText());
                            row.append("</td>\n");
                            if (counter % 2 == 0 || !answerIterator.hasNext()) {
                                if (counter % 2 != 0) {
                                    row.append("<td width=\"50%\" colspan=\"2\" bgcolor=#FAF5F5></td>");
                                }
                                row.insert(0, "<tr>\n");
                                row.append("</tr>\n");
                                sb.append(row);
                                row = new StringBuilder();
                            }
                        }
                        sb.append("</table>\n");
                        sb.append("<table>\n");
                        sb.append("<tr>\n");
                        sb.append("<td>\n");
                        sb.append("<input type=\"Submit\" value=\"Отправить ответ\">\n");
                        sb.append("</td>\n");
                        sb.append("</tr>\n");
                        sb.append("</table>\n");
                        sb.append("<input type=\"hidden\" name=\"id\" value=\"" + getTheme().getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
"                        <input type=\"hidden\" name=\"subAction\" value=\"testAnswer\">\n");
                        sb.append("</form>\n");
                        
                        break;
                    case TestAnswered:
                        sb.append("<table bgcolor=#CD7A18 width=\"100%\" cellpadding=10 cellspacing=3>\n");
                        counter = 0;
                        row = new StringBuilder();
                        answerIterator = answers.iterator();
                        while (answerIterator.hasNext()) {
                            counter++;
                            Answer answer = answerIterator.next();
                            boolean userAnswer;
                            try {
                                userAnswer =  userAnswers.get(answer.getId());
                            } catch (NullPointerException ex) {
                                userAnswer = false;
                            }
                            if (userAnswer == answer.getCorrect()) { //пользователь ответил верно
                                row.append("<td bgcolor=#3EAA08 onclick=\"getCommentHTML('" + answer.getId() + "', " + userAnswer + ")\" width=\"5%\">\n");
                            } else {
                                row.append("<td bgcolor=#DA1617 onclick=\"getCommentHTML('" + answer.getId() + "', " + userAnswer + ")\" width=\"5%\">\n");
                            }
                            row.append("<input type=\"checkbox\" " + (userAnswer ? "checked" : "") + " disabled>");
                            row.append("</td>\n");
                            row.append("<td width=\"45%\" bgcolor=#FAF5F5 style=\"font-family:Arial; color:#48050C\">\n");
                            row.append(answer.getText());
                            //row.append("<a href=\"sdf\" target=\"_blank\">" +  answer.getText() + "</a>");
                            row.append("</td>\n");
                            if (counter % 2 == 0 || !answerIterator.hasNext()) {
                                if (counter % 2 != 0) {
                                    row.append("<td width=\"50%\" colspan=\"2\" bgcolor=#FAF5F5></td>");
                                }
                                row.insert(0, "<tr>\n");
                                row.append("</tr>\n");
                                sb.append(row);
                                row = new StringBuilder();
                            }
                        }
                        sb.append("</table>\n");
                sb.append("                    <form method=\"POST\" action=\"doActive\">\n" +
        "                        <input type=\"hidden\" name=\"id\" value=\"" + theme.getId() + "\">\n" +
        "                        <input type=\"hidden\" name=\"action\" value=\"doTheme\">\n" +
        "                        <input type=\"hidden\" name=\"subAction\" value=\"next\">\n" +
        "                        <input type=\"Submit\" value=\"Далее\">\n" +
        "                    </form>\n" +
        "");
                        
                        break;
                }
                break;
        }
        return sb.toString();
        
    }
    
    public void processWorkflow(String subAction, Map<String, String[]> requestMap) {
        if (subAction == null)
            return;
        switch (subAction) {
            case "next":
                this.next();
                break;
            case "showAnswer": //показать ответ в общем вопросе
                qState = QuestionState.AnswerShowed;
                break;
            case "yesAnswer": //подтверждение верного ответа на общий вопрос
                next();
                break;
            case "noAnswer": //подтверждение неверного ответа на общий вопрос
                next();
                break;
            case "testAnswer": //произведен ответ на тестовый вопрос
                for (Map.Entry<String, Object> entry : Utils.translateWebData(requestMap).entrySet()) {
                    String[] splitted = entry.getKey().split("_");
                    if (splitted.length == 2 && splitted[0].equals("answer")) {
                        int answerId = Integer.parseInt(splitted[1]);
                        if (((String)entry.getValue()).equals("on")) {
                            userAnswers.put(answerId, Boolean.TRUE);
                        }
                    }
                }
                qState = QuestionState.TestAnswered;
                break;
        }
    }
    
    public String getStopBtn() {
        return "                    <form method=\"POST\" action=\"doActive\">\n" +
"                        <input type=\"hidden\" name=\"id\" value=\"" + getTheme().getId() + "\">\n" +
"                        <input type=\"hidden\" name=\"action\" value=\"stopTheme\">\n" +
"                        <input type=\"submit\" value=\"Завершить\">\n" +
"                    </form>\n" +
"";
    }
    
    private enum QuestionState {
        New, AnswerShowed, TestAnswered
    }
    
    
}
