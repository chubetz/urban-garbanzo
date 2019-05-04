/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

import java.util.Collections;
import java.util.Set;
import static ru.garbanzo.urban.edu.Entity.getStorage;

/**
 * Заготовка нового класса доступа к сущностям
 * @author d.gorshenin
 */
public class EduAccess {
    
    public static Set<? extends Entity> getThemeQuestionSet() {
        return Collections.unmodifiableSet(getStorage().getThemeQuestionSet());
    }
}
