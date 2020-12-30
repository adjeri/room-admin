/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kic.admin.models;

/**
 *
 * @author adjeri
 */
public class Course {
    private int id;
    private String code;
    private String title;
    private String short_name;
    private String category;
    private int credits;
    private boolean is_elective;

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getTitle() {
        return title;
    }

    public String getShort_name() {
        return short_name;
    }

    public String getCategory() {
        return category;
    }

    public int getCredits() {
        return credits;
    }

    public boolean getIs_elective() {
        return is_elective;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setShort_name(String short_name) {
        this.short_name = short_name;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public void setIs_elective(boolean is_elective) {
        this.is_elective = is_elective;
    }

    public Course(String code, String title, String short_name, String category, int credits, boolean is_elective) {
        this.code = code;
        this.title = title;
        this.short_name = short_name;
        this.category = category;
        this.credits = credits;
        this.is_elective = is_elective;
    }
    
    
}
