/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;

/**
 *
 * @author d.gorshenin
 */
public class Exam implements Iterator<Question> {
    
    private List<Question> questionSequence;
    private Iterator<Question> iterator;
    private Question current;
    private int counter;
    
    @Override
    public boolean hasNext() {
        return iterator.hasNext();
    }

    @Override
    public Question next() {
        counter++;
        current = iterator.next();
        return getQuestion();

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
        questionSequence = new ArrayList(theme.getQuestionMap().values());
        Collections.shuffle(questionSequence);
        iterator = questionSequence.iterator();
    }

    
}
