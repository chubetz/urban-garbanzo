/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import static ru.garbanzo.urban.edu.Entity.getStorage;

/**
 *
 * @author mithia
 */
public class Image extends Entity {

    Image(int id) {
        super("Image", id);
    }

    private static Map<String, Object> defaultState, defaultPrimaryKey;

    @Override
    public boolean isPkAuto() {
        return true;
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
        defaultPrimaryKey.put("id", -1);

        defaultState = new LinkedHashMap<String, Object>();
        defaultState.put("filename", "");
        defaultState.put("extension", "");
    }
    
    public static Map<Integer, Image> getMap() {
        return Collections.unmodifiableMap(getStorage().getImageMap());
    }
    
}
