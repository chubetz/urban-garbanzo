/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

/**
 *
 * @author mithia
 */
public class MockQuestion {
    
    private Question question;
    
    MockQuestion(Question q) {
        this.question = q;
    }
    
    public Object getId() {
        return null;
    }

    public String getRealmsHTML() {
        return question.getRealmsHTML();
    }

    public String getTypesHTML() {
        return question.getTypesHTML();
    }
    
    public String getText() {
        return "";
    }

    public String getAnswersCorrectHTML() {
        return question.getAnswersCorrectHTML();
    }

    public String getAnswersEditHTML() {
        return question.getAnswersEditHTML();
    }
}
