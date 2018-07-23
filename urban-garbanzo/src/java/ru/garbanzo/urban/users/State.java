/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.users;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import ru.garbanzo.urban.edu.Exam;
import ru.garbanzo.urban.edu.Storage;
import ru.garbanzo.urban.edu.Theme;
import ru.garbanzo.urban.exception.ExamException;
import ru.garbanzo.urban.exception.JDBCException;

/**
 *
 * @author d.gorshenin
 */
public class State {
    private static State state;
    private static Storage storage;
    
    private Map<Theme, Exam> themeExams = new ConcurrentHashMap<Theme, Exam>();
    
    public static State getUserState() {
        if (state == null)
            state = new State();
        return state;
    }
    
    public static void resetState(Storage storage) {
        if (storage != null && State.storage != storage) {
            State.storage = storage;
            state = null;
        }
    }
    
    public Exam getExam(Theme theme) throws ExamException {
        Exam exam = themeExams.get(theme);
        if (exam == null) {
            exam = new Exam(theme);
            themeExams.put(theme, exam);
            exam.next();
        }   
        return exam;

    }
    
    public Exam stopExam(Theme theme) throws JDBCException {
        Exam exam = themeExams.get(theme);
        if (exam != null) {
            exam.saveStatistics();
        }   
        return themeExams.remove(theme);
    }

    public Exam cancelExam(Theme theme) {
        Exam exam = themeExams.get(theme);
        if (exam != null) {
            
        }   
        return themeExams.remove(theme);
    }
}
