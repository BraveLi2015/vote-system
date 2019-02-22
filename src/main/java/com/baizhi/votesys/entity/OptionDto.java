package com.baizhi.votesys.entity;

import java.util.ArrayList;
import java.util.List;

public class OptionDto {
    List<Option> optionList = new ArrayList<>();

    @Override
    public String toString() {
        return "OptionDto{" +
                "optionList=" + optionList +
                '}';
    }

    public List<Option> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<Option> optionList) {
        this.optionList = optionList;
    }
}
