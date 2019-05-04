/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author mithia
 */
class MockQuestion extends Question{ // Этот класс нужен, чтобы передавать данные при перерисовке страницы редактирования
    
    private Map<String, ?> data;
    private Map<Integer, Answer> answerMap;
    
    MockQuestion(Map<String, ?> data) {
        super(-1);
        setState(data);
        setPrimaryKey(data);
        this.data = data;
    }

    @Override
    public boolean isSaveable() {
        return false; 
    }

    @Override
    public Map<Integer, Answer> getAnswerMap() {
        if (answerMap == null) {
            answerMap = new LinkedHashMap<Integer, Answer>();
            for (Answer answer : Answer.getGeneratedFromFrontendAnswerList(data)) {
                    answerMap.put(answer.getId(), answer);
            }

        } 
        return answerMap;

    }
    
    
    
}
