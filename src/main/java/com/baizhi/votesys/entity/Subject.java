package com.baizhi.votesys.entity;

import java.util.List;

public class Subject {
    private int id;
    private String title;
    private int type;
    private List<Option> optionList;

    public List<Option> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<Option> optionList) {
        this.optionList = optionList;
    }

    public Subject() {
    }

    public Subject(int id, String title, int type) {
        this.id = id;
        this.title = title;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", type=" + type +
                ", optionList=" + optionList +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
