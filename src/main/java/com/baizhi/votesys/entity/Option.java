package com.baizhi.votesys.entity;

public class Option {
    private int optionId;
    private int subjectId;
    private String optionContent;
    private int optionOrder;

    public Option() {
    }

    public Option(int optionId, int subjectId, String optionContent, int optionOrder) {
        this.optionId = optionId;
        this.subjectId = subjectId;
        this.optionContent = optionContent;
        this.optionOrder = optionOrder;
    }

    @Override
    public String toString() {
        return "Option{" +
                "optionId=" + optionId +
                ", subjectId=" + subjectId +
                ", optionContent='" + optionContent + '\'' +
                ", optionOrder=" + optionOrder +
                '}';
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getOptionContent() {
        return optionContent;
    }

    public void setOptionContent(String optionContent) {
        this.optionContent = optionContent;
    }

    public int getOptionOrder() {
        return optionOrder;
    }

    public void setOptionOrder(int optionOrder) {
        this.optionOrder = optionOrder;
    }
}
