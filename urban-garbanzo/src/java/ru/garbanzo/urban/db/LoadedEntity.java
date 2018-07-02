/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.db;

import java.util.HashMap;
import java.util.Map;
import ru.garbanzo.urban.edu.Entity;

/**
 *
 * @author mithia
 */
class LoadedEntity extends Entity {
    
    LoadedEntity() {
        super(null, null);
    }

    @Override
    public synchronized void setPrimaryKey(Map<String, ?> map) {
        super.setPrimaryKey(map); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public synchronized void setState(Map<String, ?> map) {
        super.setState(map); //To change body of generated methods, choose Tools | Templates.
    }
    
    

    @Override
    protected Map<String, Object> getDefaultState() {
        return new HashMap<String, Object>();
    }

    @Override
    protected Map<String, Object> getDefaultPrimaryKey() {
        return new HashMap<String, Object>();
    }

    @Override
    public boolean isPkAuto() {
        throw new UnsupportedOperationException("Не табличный, а вспомогательный объект"); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
