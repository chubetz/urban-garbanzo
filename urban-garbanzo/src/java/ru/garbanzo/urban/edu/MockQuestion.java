/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import ru.garbanzo.urban.db.JDBCUtils;
import static ru.garbanzo.urban.edu.Entity.getStorage;
import ru.garbanzo.urban.exception.NoQuestionException;
import ru.garbanzo.urban.util.Utils;

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
            String[] corrects = new String[0];
            if (data.get("correct") != null) {
                try {
                    corrects = (String[])data.get("correct");
                } catch (ClassCastException cce) {
                    corrects = new String[] {(String)data.get("correct")};
                }
                Arrays.sort(corrects);
            }
            for (Map.Entry<String, ?> entry: data.entrySet()) {
                String[] ans = entry.getKey().split("_");
                if ((ans.length == 2) && ans[0].equals("answer")) { // данные ответа

                    int answerId = Integer.parseInt(ans[1]);

                    Map<String, Object> answerData = new HashMap<String, Object>();
                    if (Arrays.binarySearch(corrects, ans[1]) >= 0)
                        answerData.put("correct", true);
                    else
                        answerData.put("correct", false);
                    answerData.put("text", entry.getValue());

                    Answer answer = new Answer(answerId);
                    answer.setState(answerData);
                    answerMap.put(answerId, answer);
                }

            }
            
        } 
        return answerMap;
            

    }
    
    
    
}
