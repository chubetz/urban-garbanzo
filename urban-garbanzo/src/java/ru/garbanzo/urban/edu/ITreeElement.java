/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author d.gorshenin
 */
public interface ITreeElement {
    
    final ITreeElement MAIN_TREE = new ITreeElement() {
        @Override
        public List<ITreeElement> getTreeElements() {
            return new ArrayList<ITreeElement>(Realm.getMap().values());
        }

        @Override
        public TreeSign getTreeSign() {
            return new TreeSign() {
                @Override
                public String getName() {
                    return "Дерево сущностей"; //To change body of generated methods, choose Tools | Templates.
                }
                
            };
        }

    };
    
    List<ITreeElement> getTreeElements();
    
    TreeSign getTreeSign();
    
    default String getTreeHTML() {
        StringBuilder sb = new StringBuilder();
        
        
        return null;
    }
    
}
