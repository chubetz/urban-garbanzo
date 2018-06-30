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

    ThemeQuestion(int id) {
        super(id, "Theme");
    }

    private static Map<String, Object> defaultState;

    @Override
    protected Map<String, Object> getDefaultState() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    static {
        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("questionId", -1);
        defaultState.put("themeId", -1);
    }
}
