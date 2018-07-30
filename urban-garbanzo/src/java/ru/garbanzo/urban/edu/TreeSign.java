/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.edu;

/**
 *
 * @author d.gorshenin
 */
public class TreeSign {
    private String link;
    private String name;
    private boolean expanded;

    public String getLink() {
        return link;
    }

    public String getName() {
        return name;
    }

    public boolean isExpanded() {
        return expanded;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setExpanded(boolean isExpanded) {
        this.expanded = isExpanded;
    }
    
}
