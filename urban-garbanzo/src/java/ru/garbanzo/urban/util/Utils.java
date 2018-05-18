/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.util;

import java.util.List;
import java.util.Map;

/**
 *
 * @author d.gorshenin
 */
public class Utils {
    
    public static String mapToString(Map<?,?> map) {
        StringBuilder sb = new StringBuilder('[');
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            sb.append(entry.getKey().toString() + " => " + convertToString(entry.getValue()) + ", ");
        }
        sb.append(']');
        return sb.toString();
    }
    
    public static String listToString(List<?> list) {
        StringBuilder sb = new StringBuilder('[');
        for (Object entry : list) {
            sb.append(convertToString(entry) + ", ");
        }
        sb.append(']');
        return sb.toString();
    }

    public static String arrayToString(List<?> list) {
        StringBuilder sb = new StringBuilder('[');
        for (Object entry : list) {
            sb.append(convertToString(entry) + ", ");
        }
        sb.append(']');
        return sb.toString();
    }

    public static String convertToString(Object obj) {
        String str = null;
        if (obj instanceof Map) {
            str = mapToString((Map)obj);
        } else if (obj instanceof List) {
            str = listToString((List)obj);
        } else {
            str = obj.toString();
        }
        return str;
    }
    
    public static void print(Object obj) {
        System.out.println(convertToString(obj));
    }
    
}
