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
public class ThemeQuestion extends Entity {

    ThemeQuestion(int themeId, int questionId) {
        super("ThemeQuestion", themeId, questionId);
    }

    private static Map<String, Object> defaultState, defaultPrimaryKey;

    @Override
    protected Map<String, Object> getDefaultState() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
}
