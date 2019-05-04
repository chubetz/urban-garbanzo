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
import ru.garbanzo.urban.edu.WorkOnErrorsExam;
import ru.garbanzo.urban.exception.ExamException;
import ru.garbanzo.urban.exception.JDBCException;

/**
 * Объект, хранящий состояние сеанса работы с системой
 * @author d.gorshenin
 */
public class State {
    
    private Map<Theme, Exam> themeExams = new ConcurrentHashMap<Theme, Exam>();
    private User user;
    
    public Exam getExam(Theme theme, int examType) {
        Exam exam = themeExams.get(theme);
        if (exam == null) {
            switch (examType) {
                case Exam.REGULAR:
                    exam = new Exam(theme, false);
                    break;
                case Exam.REFRESH_ONLY:
                    exam = new Exam(theme, true);
                    break;
                case Exam.WORK_ON_ERRORS:
                    exam = new WorkOnErrorsExam(theme);
                    break;
            }
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
