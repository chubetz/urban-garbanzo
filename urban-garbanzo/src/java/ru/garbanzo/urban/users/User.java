/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.users;

import ru.garbanzo.urban.edu.Storage;

/**
 * Объект пользователя системы - заготовка
 * @author d.gorshenin
 */
public class User {
    
    private static User defaultUser;
    private String login;
    private State state;
    private Storage storage;
    
    public static User getDefaultUser() {
        if (defaultUser == null || Storage.getStorage() != defaultUser.storage) {
            defaultUser = new User();
            defaultUser.login = "chubetz";
            defaultUser.state = new State();
            defaultUser.storage = Storage.getStorage();
        }
        
        return defaultUser; 
    }
    
    public State getState() {
        return this.state;
    }
    
    public IStatistics getStatistics() {
        return storage.getStatistics();
    }
    
    
}
