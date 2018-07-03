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
class ThemeQuestion extends Entity {

    ThemeQuestion(int themeId, int questionId) {
        super("ThemeQuestion", themeId, questionId);
    }

    private static Map<String, Object> defaultState, defaultPrimaryKey;

    public boolean isPkAuto() {
        return false;
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
        defaultPrimaryKey.put("themeId", -1);
        defaultPrimaryKey.put("questionId", -1);

        defaultState = new LinkedHashMap<String, Object>(); //нет полей, кроме PK
    }

    @Override
    public boolean equals(Object obj) {
        return (obj instanceof ThemeQuestion) && 
                ((ThemeQuestion)obj).getPrimaryKey().equals(this.getPrimaryKey());
    }
    
    
}
