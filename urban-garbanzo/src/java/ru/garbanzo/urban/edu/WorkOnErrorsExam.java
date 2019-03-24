/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;
import ru.garbanzo.urban.exception.JDBCException;

/**
 *
 * @author mithia
 */
public class WorkOnErrorsExam extends Exam {
    
    public WorkOnErrorsExam(Theme theme) {
        this.theme = theme;
        questionSequence = new ArrayList(theme.getValidQuestions().stream()
            .filter(q -> q.isWeak())
            .collect(Collectors.toList()));
        Collections.shuffle(questionSequence);
        iterator = questionSequence.iterator();
        
    }

    @Override
    public void saveStatistics() throws JDBCException {
        saveUserAnswers();
    }
    
     
    
}
